require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'net/http'

=begin
require '/Users/antonio/Desktop/test'
include IdealistaWeb
r = process_idealista_href("")
r = process_idealista_href("http://www.idealista.com/pagina/inmueble?codigoinmueble=VW0000001866737&numInm=3&edd=list")
=end

module IdealistaWeb

  class IdealistaOffer
    attr_accessor :euros
    attr_accessor :phone
    attr_accessor :city
    attr_accessor :street
    attr_accessor :zip
  end

  def process_idealista_href ref
    doc = Hpricot(open(ref))
    offer = IdealistaOffer.new
    doc.search('body#detinmueble/div#main/div.container/div#property_data/div#main_data/div.infoblock').each do |info|
      check_euros info,offer
      check_phone info,offer
      check_address info,offer
    end
    offer
  end


  def check_euros elem,offer
    begin
      if elem.inner_html.index("euros") != nil
        offer.euros = elem.inner_html.split("euros")[0].split("<strong>")[1].to_i.to_s
      else
        return nil
      end
    rescue Exception => ex
      return nil
    end
  end

  def check_phone elem,offer
    begin
      if elem.inner_html.index("contactar") != nil
        offer.phone = elem.search("/h3").inner_html.split(" -")[0]
      else
        return nil
      end
    rescue Exception => ex
      return nil
    end
  end

  def check_address elem,offer
    begin
      if elem.inner_html =~ /<li>[0-9]{5,5} /
        street = elem.search("//h3/strong").inner_html
        elem.search("//li").each do |li|
          if li.inner_html =~ /^[0-9]{5,5} /
            (zip,city) = li.inner_html.split(" ")
            offer.zip = zip
            offer.city = city
          end
        end
        offer.street = street
      else
        return nil
      end
    rescue Exception => ex
      return nil
    end
  end

end
