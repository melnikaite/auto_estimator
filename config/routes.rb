AutoEstimator::Application.routes.draw do
  resources :attachments
  resources :contacts
  resources :efforts
  resources :estimates do
    post :import
    get :export
  end
  resources :features
  resources :links
  resources :projects
  root :to => 'projects#index'
end
