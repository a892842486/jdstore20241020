Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  namespace :admin do
    resources :products
    resources :orders do
      member do
        get :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :orders do
    member do
      post :pay_with_creditcard
      post :pay_with_ewallet
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
  end

end
