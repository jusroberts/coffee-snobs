module BeansHelper

    def average_rating bean_id
        ratings = BeanRating.all.where(bean_id: bean_id).map { |b| b.rating }
        (ratings.inject { |sum, element| sum + element }.to_f / ratings.size).round(1)
    end

    def user_rating user, bean_id
        return nil unless user
        BeanRating.all.where(user_id: user.id, bean_id: bean_id)[0].rating rescue nil
    end

    def rating_distribution bean_id
        ratings = BeanRating.all.where(bean_id: bean_id)
        buckets = rating_buckets
        ratings.each { |r| buckets[r.rating - 1] += 1 }
        buckets
    end

    def bean_rating_options
        [
            ["5 - I would bathe in this", 5],
            ["4 - Good", 4],
            ["3 - Okay", 3],
            ["2 - I'll drink it, but I won't like it", 2],
            ["1 - This belongs in a toilet", 1]
        ]
    end

    private

    def rating_buckets
        [0,0,0,0,0]
    end

end
