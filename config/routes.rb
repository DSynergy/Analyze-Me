Rails.application.routes.draw do
  root 'staticpages#dashboard'
  match ':status', to: 'errors#show', via: :all, constraints: {status: /\d{3}/ }
  get 'auth/:provider/callback', to: 'sessions#create'
  post 'logout',                 to: 'sessions#destroy'

  namespace :types do
    get 'type', to: "type#index"
    get 'ESTP', to: 'type#ESTP'
    get 'ESFP', to: 'type#ESFP'
    get 'ENFP', to: 'type#ENFP'
    get 'ENTP', to: 'type#ENTP'
    get 'ESTJ', to: 'type#ESTJ'
    get 'ESFJ', to: 'type#ESFJ'
    get 'ENFJ', to: 'type#ENFJ'
    get 'ENTJ', to: 'type#ENTJ'
    get 'INTJ', to: 'type#INTJ'
    get 'INFJ', to: 'type#INFJ'
    get 'ISTJ', to: 'type#ISTJ'
    get 'ISFJ', to: 'type#ISFJ'
    get 'INFP', to: 'type#INFP'
    get 'INTP', to: 'type#INTP'
    get 'ISTP', to: 'type#ISTP'
    get 'ISFP', to: 'type#ISFP'
  end

  resources :user, only: [:show]

  get 'about',               to: 'staticpages#about'
  get 'background',          to: 'staticpages#background'
  get 'hedonometer',         to: 'staticpages#hedonometer'
  get 'dashboard',           to: 'staticpages#dashboard'
  get 'typealyzer',          to: 'staticpages#typealyzer'
  get 'me',                  to: "staticpages#me"
  get 'privacy',             to: "staticpages#privacy"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products


  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
