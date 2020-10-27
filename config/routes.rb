Rails.application.routes.draw do
  root 'pages#home'
  get 'recipes/generate'
  get 'recipes/suggest', constraints: { format: 'json' }
  get 'recipes/:id', to: 'recipes#show', as: 'recipe'
  post 'sessions/create'# , constraints: { format: 'json' }
  delete 'sessions/destroy'
end
