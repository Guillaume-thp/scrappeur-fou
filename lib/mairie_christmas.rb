require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
def get_the_email_of_a_townhal_from_its_webpage(url)
  array_ur=[]
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/"))
  page.xpath('/html/body/pre/a]').each do |url|
    array_ur << url.text
  end
  print array_ur  
end

def get_the_town_list

end

def perform

end

perform

