class Bean < ApplicationRecord
    belongs_to :roaster
    belongs_to :origin
    belongs_to :roast_level
    
    has_many :bean_ratings
end
