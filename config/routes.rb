
class CsvExportConstraint
  def self.matches?(request)
    request.params.has_key?(:export_csv)
  end
end


Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
  
  resources :graphs, only: [:show,:index]

  resources :patients do
    collection do
      post :import
    end
  end

  resources :kansatus do
    collection do
      get :search
      post :import
    end
  end
  
  resources :tentous do
    collection do
      get :search
      post :import
    end
  end





end
