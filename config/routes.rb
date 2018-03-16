Rails.application.routes.draw do
  
  
  get 'bugs/show/:id' , to: 'bugs#show'
 
  get 'bugs/new/:id', to: 'bugs#new'
  post 'bugs/create_bug', to: 'bugs#create_bug'
  get 'bugs/details/:id', to: 'bugs#details'
  get 'projects/new'


  post 'projects/create'

  get 'projects/destroy/:id' ,to: 'projects#destroy'

  get 'dashboard/home'
   get 'dashboard/project_details/:id',to: 'dashboard#project_details'

  get 'users/new'

  post 'users/signup'

  get 'users/login'

  get 'users/logout'

  post 'users/process_login', to: 'users#process_login'

  root to: 'users#login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end