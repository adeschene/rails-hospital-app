Rails.application.routes.draw do
  root "appointments#index"

  resources :appointments, :doctors, :patients
end
