# frozen_string_literal: true

Rails.application.routes.draw do
  resources :items
  resources :item_importers, only: %i[index create]
  resources :item_exporters, only: %i[index create]
  mount Raes::Engine => '/raes'
end
