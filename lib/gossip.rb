require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize (author, content)
    @author = author
    @content = content
  end

  def save
#Chaque élément de CSV.open  (dans gossip.csv)
    CSV.open("./db/gossip.csv", "ab") do |csv|
  #va enregistrer les informations renseignées.
      csv << ["#{@author}", "#{@content}"]
    end
  end
end