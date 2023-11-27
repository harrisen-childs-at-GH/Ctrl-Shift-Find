Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :user_files do 
    post :ask_question
  end

  # Defines the root path route ("/")
  #  root "user_files#index"
end
