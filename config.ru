#Equivalent du app.rb, il initialise le lancement de l'application
require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'
run ApplicationController