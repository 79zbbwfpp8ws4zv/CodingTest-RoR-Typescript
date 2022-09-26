# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#landing"
  post "todo", to: "home#edit_todo_item"
  post "reset", to: "home#reset_todo_items"
  delete '/todo/:id', to: 'home#delete_todo_item', as: 'delete_todo_item'
end
