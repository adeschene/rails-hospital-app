Rails.application.routes.draw do
  root "appointments#index"

  # Nested resources gives us access to docs and patients from applications
  resources :appointments do
  	resources :doctors
  	resources :patients
  end
end
