class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates :cocktail, uniqueness: {scope: :ingredient}
  # This validates the uniqueness of the cocktail not en soi,
  # but en fonction de the ingredient. That is to say, there are many repeat
  # cocktails in the doses DB, because each cocktail has many ingredients.
  # But in each unique dose, the cocktail must be unique in respect to the ingredient.
end
