class Recipe < ApplicationRecord
    validates :name, :ingredients, :directions, :main_spirit_id, presence: true
    belongs_to :user
    belongs_to :main_spirit
    has_many :reviews
end
