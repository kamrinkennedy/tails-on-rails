class Recipe < ApplicationRecord
    belongs_to :user
    belongs_to :main_spirit
    has_many :reviews
end
