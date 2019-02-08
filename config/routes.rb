Rails.application.routes.draw do

  resources :bill_lists do
    resources :bill_items
  end

  root "bill_lists#index"
end
