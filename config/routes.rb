Rails.application.routes.draw do
  post 'add_to_cart' => 'cart#add_to_cart'
  delete 'remove_from_cart' => 'cart#remove_from_cart'
  get 'view_order' => 'cart#view_order'
  put 'view_order' => 'cart#view_order'
  get 'checkout' => 'cart#checkout'
  post 'order_complete' => 'cart#order_complete'
  put 'edit_order' => 'cart#edit_order'

  devise_for :users
  
  root 'storefront#all_items'
  get 'categorical' => 'storefront#items_by_category'
  get 'contact' => 'storefront#contact'
  get 'follow' => 'storefront#follow'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
