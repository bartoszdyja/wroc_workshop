Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'

  resources :visitors

  resources :teachers do
    get :subjects
  end
  
  resources :students do
    get :subjects
  end

  namespace :reports, as: 'report' do
    get :subjects
  end
  
  
end
