Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'

  resources :visitors

  resources :teachers

  namespace :reports, as: 'report' do
    get :subjects
  end
  
  resources :students do
    get :subjects
  end
end
