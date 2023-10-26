Rails.application.routes.draw do
  get 'user_files/new'
  get 'user_files/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "user_files#index"
end
