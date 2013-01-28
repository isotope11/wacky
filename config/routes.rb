Wacky::Engine.routes.draw do
  root to: 'pages#show', id: 'index'

  resources :pages do
    member do
      get :versions
      get :version
      post :revert_to_version
    end
  end

  
  match "/recently_updated" => "special_pages#recently_updated"
  match "/all_pages" => "special_pages#all_pages"
  match "/:id" => "pages#show"
end
