Rails.application.routes.draw do
  root 'pages#home'
  get 'recipes/generate'
  get 'recipes/suggest', constraints: { format: 'json' }
  get 'recipes/:id', to: 'recipes#show', as: 'recipe'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
