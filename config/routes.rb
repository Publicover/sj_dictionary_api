Rails.application.routes.draw do
  resources :words do
    resources :definitions
  end
  # get 'words/index'
  # get 'words/show'
  # get 'definitions/index'
  # get 'definitions/show'
end
