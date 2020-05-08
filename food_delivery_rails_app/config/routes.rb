Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    resource :user, only: [:create,:update,:index]
    patch  'user/update_contact_number' , to: 'users#update_contact_number'
    patch  'user/update_address' , to: 'users#update_address'
    get    'restaurant/:id/get_menu' , to: 'restaurants#get_menu'
    post   'restaurant/:id/set_menu' , to: 'restaurants#set_menu'
    post   'restaurant/update_delivery_range' , to: 'restaurants#update_delivery_range'
    get    'user/delivering_restaurants' , to: 'users#get_delivering_restaurants'
    resource :session, only: [:create, :destroy,:show]
    resources :food_items
  end
end
