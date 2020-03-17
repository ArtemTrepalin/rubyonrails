# frozen_string_literal: true

# Module for convert array of hashes to atom format
module AtomConverter
  def self.convert(input)
    builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.feed('xmlns' => 'http://www.w3.org/2005/Atom', 'xmlns:georss' => 'http://www.georss.org/georss') do
        input.each do |attr|
          xml.entry do
            xml.id_ attr[:id]
            xml.title_ attr[:title]
            xml.updated_ attr[:updated]
            xml.published attr[:date]
            xml.rights attr[:rights]
            xml.link_('href' => attr[:link])
            xml.summary_ attr[:summary]
            xml.category_('term' => attr[:category])
          end
        end
      end
    end
    builder.to_xml
  end
end