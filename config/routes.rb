Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  get '/authors/:id', to: 'authors#show'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/authors/:id/books', to: 'author_books#index'
  post '/authors', to: 'authors#create'
  get 'authors/:id/edit', to: 'authors#edit'
  patch 'authors/:id', to: 'authors#update'
end
