# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  resources :posts do
    resources :comments, controller: 'posts/comments', only: %i[create edit update destroy]
  end
  # END
end
