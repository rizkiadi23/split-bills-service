json.extract! bill_list, :id, :title, :description, :created_at, :updated_at
json.url bill_list_url(bill_list, format: :json)
