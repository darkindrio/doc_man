Rails.application.routes.draw do
  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
  authenticate :user do
      resources :documents do
        get 'categories', on: :member
      end
      resources :categories
      resources :users
      root to: 'documents#my_documents_index'
      get "my_documents" => 'documents#my_documents_index', :as => :my_documents
  end
  get "/test" => "documents#markdownHtml"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
