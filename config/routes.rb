Rails.application.routes.draw do


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :students do
    collection do
      post :import
    end
  end
  resources :collection do
    collection do
      post :import
      get :filter
      get :index_pdf
      delete :delete_all
    end
  end

  root 'collection#index'
end
