require 'gossip'

class ApplicationController < Sinatra::Base
#Affiche la page html index ('/').
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

#Affiche la page html '/gossips/new/' sur laquelle il y a le formulaire.
  get '/gossips/new/' do
    erb :new_gossip
  end
  
#Récupère les données du formulaire de la page et les renvoie à la database (db) html '/gossips/new/'.
  post '/gossips/new/' do
    Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
    redirect '/'
  end

#Demande à la page show de définir une variable (gossip) qui sera le résultat de gossip.find, params sert à récupérer de façon temporaire,
  #ce qui a été écrit avant un rechargement, id est le numéro qui sera incrémenté dans l'index et réutilisé pour créer de nouvelles URL.
  get '/gossips/:id/' do
    erb :show, locals: {gossip: Gossip.find(params['id'].to_i), id: params['id']}
  end

  # get 'gossips/:id/edit' do
  #   erb :edit
  # end

end