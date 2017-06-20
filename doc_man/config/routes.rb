Rails.application.routes.draw do
  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
  authenticate :user do
      resources :documents do
        get 'categories', on: :member
        resources :suggestions
      end
      resources :categories
      resources :users
      root to: 'documents#my_documents_index'
      get "my_documents" => 'documents#my_documents_index', :as => :my_documents
  end
  get "public_documents" => 'documents#public_documents_index', :as => :public_documents
  get "public_show" => 'documents#public_show', :as => :public_show
  get "/test" => "documents#markdownHtml"
  post "/collaborators" => "documents#updateCollaborators"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
