Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [] do 
    resources :pets, only: [:new, :create, :index, :edit, :update, :destroy]
  end

  devise_scope :user do
     authenticated :user do
       root 'pets#index', as: :authenticated_root
     end

     unauthenticated do
       root 'devise/sessions#new', as: :unauthenticated_root
     end
   end

  get '/api/pets/:id' => 'pets#json'
  get '/api/users/:id' => 'users#json'

end
