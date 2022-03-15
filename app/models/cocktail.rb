class Cocktail < ApplicationRecord
  belongs_to :base_spirit
  validates_presence_of :name, :instructions
  # validates :name, presence: true
  # validates :instructions, presence: true
end
