require 'open-uri'
require 'nokogiri'

	doc = Nokogiri::HTML(open("http://www.google.com/search?q=doughnuts"))
	doc.xpath('//h3/a').each do |node|
	  puts node.text
	end

    The XPath used in this program is:

	//h3/a
In English, this XPath says:

Find all "a" tags with a parent tag whose name is "h3"
To match “h3” tags that have a class attribute, we write:

	h3[@class]
To match “h3” tags whose class attribute is equal to the string “r”, we write:

	h3[@class = "r"]
Using the attribute matching construct, we can modify our previous query to:

	//h3[@class = "r"]/a[@class = "l"]
which in English terms is:

Find all "a" tags with a class attribute equal to "l" and an immediate parent tag "h3" that has a c``

Ouvrir l'URL souhaitée sous Nokogiri et le stocker dans un objet page avec page = Nokogiri::HTML(open("ton_url_a_scrapper.com"))
Extraire les éléments HTML que tu veux scrapper en utilisant leur XPath et en les stockant dans un array (par exemple all_emails_links) avec all_emails_links = page.xpath('/mettre_ici_le_XPath'). Dans ce cas all_emails_links est un array d'éléments HTML.