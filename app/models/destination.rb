class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent
        self.posts.order("created_at ASC").limit(5)
    end

    def featured_post
        self.posts.max_by { |post| post.likes}
    end

    def avg_age
        ages = self.bloggers.uniq.pluck(:age)
        ages.sum / ages.count
    end

end
