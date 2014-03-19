class Category < ActiveRecord::Base

  # CONSTANTS
  RATING_SCORES = [['Bad', -1], ['Neutral', 0], ['Good', 1]]

  # RELATIONSHIPS
  has many :category_assignments

  # SCOPES
  

  # VALIDATIONS
  validates_presence_of :category_type

end
