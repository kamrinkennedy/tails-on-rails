class Recipe < ApplicationRecord
    validates :name, :ingredients, :directions, presence: true
    belongs_to :user
    belongs_to :main_spirit
    has_many :reviews
    has_many :reviewers, through: :reviews, source: :user

    def average_rating
        if !self.reviews.empty?
            self.reviews.average("rating").round(2)
        else
            nil
        end
    end

    def name_and_creator
        "#{self.name} - created by #{self.user.username} on #{self.created_at}"
    end

    def name_and_rating
        "#{self.name} - Rating: #{self.avg_rating.round(2)}"
    end


    def self.top_rated
        self.select("recipes.*, AVG(rating) as avg_rating").joins(:reviews).group(:id).order("AVG(rating) desc")
    end


end
