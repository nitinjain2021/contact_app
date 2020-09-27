# frozen_string_literal: true

Rails.application.routes.draw do
  root 'contacts#new'
  get 'contact', to: 'contacts#new'
  resource :contacts, only: :create
end
