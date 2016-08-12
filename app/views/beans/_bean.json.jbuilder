json.extract! bean, :id, :roaster_id, :name, :roast_level_id, :origin_id, :notes, :in_stock, :created_at, :updated_at
json.url bean_url(bean, format: :json)