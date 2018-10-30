Rails.application.routes.draw do
  resources :patient_cases
  resources :symptoms
  resources :considerations
  resources :medications
  resources :diagnoses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
