json.extract! deal, :id, :title, :is_live, :discription, :price, :discounted_price, :quantity, :publish_date, :attachment, :created_at, :updated_at
json.url deal_url(deal, format: :json)
