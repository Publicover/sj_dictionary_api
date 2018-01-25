Rails.application.routes.draw do
  resources :words do
    resources :definitions
  end
end
