Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "registrations"}

  devise_scope :user do
    authenticated :user do
      root 'survey_forms#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :survey_forms do
    member do
      get :submit_survey_details
    end
  end
  
  resources :survey_answers, only: [:create]
end
