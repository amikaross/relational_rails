Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  get '/authors/:id', to: 'authors#show'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/authors/:id/books', to: 'author_books#index'
  get '/authors/:id/books/new', to: 'author_books#new'
  post '/authors', to: 'authors#create'
  post '/authors/:id/books', to: 'author_books#create'
  get 'authors/:id/edit', to: 'authors#edit'
  patch 'authors/:id', to: 'authors#update'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'
  delete '/authors/:id', to: 'authors#destroy'
end
