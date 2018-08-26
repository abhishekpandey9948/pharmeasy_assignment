Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#home'
  resources :prescriptions

  namespace :users do
    get :home_page
    get :search
    post :request_access
    post :approve_access
    get  :access_response
  end

end
