# frozen_string_literal: true
Rails.application.routes.draw do
  resources :items
  # TODO: constraints: si l'utilisateur n'a pas de personnage
  root to: redirect { Character.count > 0 ? '/characters/1' : '/characters/new' }

  resources :characters
  resources :fights
end