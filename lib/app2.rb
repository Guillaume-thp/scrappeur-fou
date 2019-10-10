require'rubygems'
require'nokogiri'    # gem pour traduire le HTML
require'open-uri'    # gem pour réaliser l'opération sur des pages en ligneÒÒ       
def get_name_crypto()   # Objectif : récupérer les noms de toutes les cryptomonnaies (sans les () il ne reconnait pas que c'est une fonction quand je l'appelle plus loin dans le code...)
​
  puts "Il y en a qui bossent ici !! Prière de faire le silence !"
​
  name_cryptomonnaies = Array.new         # création d'un espace pour stocker les noms 
   
​
  page = Nokogiri::HTML(open(' https://coinmarketcap.com/all/views/all/ '))                    # page à scrapper...httpS mon CUL !
​
    names_crypto = page.xpath('///tbody/tr/td[@class = "no-wrap currency-name"]/a[@class = "currency-name-container link-secondary"]').each do |name_crypto|
    
      nom_cryptomonnaies = name_crypto.text                              # on les récup au format texte
      name_cryptomonnaies.push(nom_cryptomonnaies)                       # à chaque fois on le rentre dans l'array
    
    
    return name_cryptomonnaies
    puts name_cryptomonnaies                                             # normalement....c'est enregistré !
​     end

​
def get_rate_crypto()      # *** objectif : récupérer toutes les valeurs des cryptomonnaies sur le marché *** # 
​
  puts "Shuuuuuuuuuuuuuuut !!!!! J'y suis presque !"
​
  rate_cryptomonnaies = Array.new              # création espace pour stocker les taux de change dans une array
​
  page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/')) # page à scrapper...httpS mon CUL !
  rates_crypto = page.xpath('///tbody/tr/td[@class = "no-wrap text-right"]/a[@class = "price"]').each do |rate_crypto|
    
    taux_cryptomonnaies = rate_crypto.text                              # on les récup au format texte
      rate_cryptomonnaies.push(taux_cryptomonnaies)                       # à chaque fois on le rentre dans l'array
    end
    return rate_cryptomonnaies                                              # normalement....c'est enregistré !
​
end
​
​
names = get_name_crypto()
rates = get_rate_crypto()
​
​
if rates.length != names.length then puts "Holy shit, so sorry honey, something happen...I won't be able to give you what you want !"
​
else
  puts "Impressed right ??! Voici les 3 cryptomonnaies les plus fortes : "
 
  n = 0
​
    while  n < 3                           # Boucle sur le nbre de crypto qui écrit son nom et le taux associé 
                puts "#{names[n]} qui vaut #{rates[n]} $ !"
  #              puts "---------------"
                n +=1
            #    i +=1
    end
end
