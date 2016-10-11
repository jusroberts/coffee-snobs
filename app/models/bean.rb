class Bean < ApplicationRecord
    belongs_to :roaster
    belongs_to :origin
    belongs_to :roast_level
    
    has_many :bean_ratings

    def average_rating
        ratings = bean_ratings.map { |b| b.rating }
        if ratings.empty?
            return -1.0
        end
        (ratings.inject { |sum, element| sum + element }.to_f / ratings.size).round(1)
    end

    def self.sorted_by_average_rating
        Bean.all.sort_by(&:average_rating)
    end
end
