Wacky::Engine.routes.draw do
  root to: 'pages#show', id: 'index'

  match "/:id" => "pages#show"

  resources :pages
end
