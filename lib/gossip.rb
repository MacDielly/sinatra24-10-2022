require 'csv'

class Gossip
  attr_accessor :author, :content

#Initialise les données
  def initialize (author, content)
    @author = author
    @content = content
  end

#Ajoute chaque élément du formulaire dans de le csv
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
  #va enregistrer les informations renseignées.
      csv << ["#{@author}", "#{@content}"]
    end
  end

#Sert a voir tous les gossips et à les retourner sous forme d'array
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

#Cherche un gossip specifique.
  def self.find(id)
    select = []
    Gossip.all.each do |i|
      select << i
    end
    select[id]
  end

  # def update

  # end

end