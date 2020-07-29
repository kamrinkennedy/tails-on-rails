class Recipe < ApplicationRecord
    validates :name, :ingredients, :directions, presence: true
    belongs_to :user
    belongs_to :main_spirit
    has_many :reviews
    has_many :reviewers, through: :reviews, source: :user

    def avg_rating
        rating = 0
        if !self.reviews.empty?
            self.reviews.each { |r| rating += r.rating }
            rating / self.reviews.length
        else
            "This cocktail has no reviews."
        end
    end

end
