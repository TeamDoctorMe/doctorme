Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  scope module: 'public' do
    resources :medications, only: [:show]
    resources :patient_cases,
              except: [:index] do
      member do
        get :symptoms
        get :diagnosis
        get :summary
      end
    end
  end

  namespace :admin do

    resources :symptoms

    resources :considerations

    resources :medications

    resources :diagnoses

    resources :patient_cases,
              only: [:index]
  end

  root 'public/pages#home'
  get 'consult_doctor', to: 'public/patient_cases#consult_doctor'
  get 'no_remedies', to: 'public/patient_cases#no_remedies'
  get 'terms_of_use', to: 'public/pages#terms_of_use'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
