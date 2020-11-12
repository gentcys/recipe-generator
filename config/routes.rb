Rails.application.routes.draw do
  root 'pages#home'
  get 'recipes/generate'
  get 'recipes/search'
  get 'recipes/suggest', constraints: { format: 'json' }
  get 'recipes/:id', to: 'recipes#show', as: 'recipe'
  post 'sessions/create'# , constraints: { format: 'json' }
  delete 'sessions/destroy'

  get 'users/:username/search_histories', to: 'users#search_histories',
                                          as: 'user_search_histories',
                                          constraints: { username: /[%\w.\-]+?/, format: 'html' }
end
