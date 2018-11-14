Rails.application.routes.draw do
  resources :patient_cases do
    member do
      get :symptoms
      get :diagnosis
      get :summary
    end
  end

  resources :symptoms

  resources :considerations

  resources :medications

  resources :diagnoses

  root 'pages#home'
  get "exclusions", to: "pages#exclusions"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
