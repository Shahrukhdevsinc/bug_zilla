Rails.application.routes.draw do
  
  

  get 'users/new'

 post 'users/signup'

  get 'users/login'

  get 'users/logout'
  root to: 'users#login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
