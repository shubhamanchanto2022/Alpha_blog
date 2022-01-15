Rails.application.routes.draw do
   root 'pages#home' # before '#' that is the name of controller, so for our application it is pages which we can see in controllers
   get 'about', to: 'pages#about'
   resources :articles, only: [:show , :index , :new , :create]
end
