Rails.application.routes.draw do

  resources :bill_lists do
    resources :bill_items
  end

  # get "bill_lists/:id/calculate_bill/:id" => "bill_lists#caluclate_bill"
  get "calculate/:id" => "bill_lists#calculate_bill"
  root "bill_lists#index"
end
