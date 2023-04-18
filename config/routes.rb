# frozen_string_literal: true
Rails.application.routes.draw do
  # TODO: constraints: si l'utilisateur n'a pas de personnage
  root to: redirect { Character.count > 0 ? '/characters/1' : '/characters/new' }

  resources :characters do
    member do
      post 'fight_opponent/:opponent_id', to: 'characters#fight_opponent', as: 'fight_opponent'
    end
  end
end