Rails.application.routes.draw do
  devise_for :users
  resource :nodes
  resource :node_pings,  only: %i(index)
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
