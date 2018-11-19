Rails.application.routes.draw do

  scope module: 'public' do
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
