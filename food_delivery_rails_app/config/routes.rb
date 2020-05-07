Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    resource :user, only: [:create,:update]
    patch  'user/update_contact_number' , to: 'users#update_contact_number'
    patch  'user/update_address' , to: 'users#update_address'
    resource :session, only: [:create, :destroy, :show]
    resources :food_items
  end
end
