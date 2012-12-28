Wacky::Engine.routes.draw do
  root to: 'pages#show', id: 'index'

  resources :pages

  match "/:id" => "pages#show"
end
