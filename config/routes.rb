Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations/registrations'
    # sessions: 'registrations/sessions'
  }

  resources :users, only: %i[show]

  root to: 'home#index'

  resources :emprendimientos, as: :businesses, controller: :businesses do
    resources :cuentas, as: :accounts, controller: :accounts
    resources :movimientos, as: :movements, controller: :movements
    resources :ingresos, as: :earnings, controller: :earnings
    resources :egresos,  as: :egresses, controller: :egresses
  end

  resources :presupuesto, as: :budgets, controller: :savings
  resources :transferencias, as: :transfers, controller: :transfers

end
