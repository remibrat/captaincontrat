# frozen_string_literal: true
Rails.application.routes.draw do
  resources :items
  # TODO: constraints: si l'utilisateur n'a pas de personnage
  root to: 'characters#index'

  resources :characters
  resources :fights
end