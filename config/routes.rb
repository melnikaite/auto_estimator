AutoEstimator::Application.routes.draw do
  resources :attachments
  resources :contacts
  resources :efforts
  resources :estimates
  resources :features
  resources :links
  resources :projects
  root :to => 'projects#index'
end
