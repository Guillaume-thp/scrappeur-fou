  require 'open-uri'
require 'nokogiri'

def recup_symbols
    crypto_symbol_array = []                             #créé un tableau vierge
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    page.xpath('//td//span/a[@class ="link-secondary"]').each do |symbol|
    crypto_symbol_array << symbol.text                                                    #ajoute chaque symbol dans leur array
     end
     return crypto_symbol_array
end
def recup_values
    crypto_value_array = []
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    page.xpath('//td/a[@class ="price"]').each do |value|
    crypto_value_array << value.text.delete('$').to_f
     end
     return crypto_value_array
end
    
def perform
    array_final = []                                     #création de l'array final qui regroupe les deux
    crypto_symbol_array = recup_symbols                #appel des 2 méthodes
    crypto_value_array = recup_values                   ##appel des 2 méthodes
    hash = Hash[crypto_symbol_array.zip crypto_value_array]    #fusion des 2 tabeaux
    hash.each do |a, b|
        myhash = {}
        myhash[a] = b
        array_final << myhash
        puts array_final                                               #affiche tableau final
    end
end
perform