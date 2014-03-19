class Category < ActiveRecord::Base

  # RELATIONSHIPS
  has many :category_assignments

  # SCOPES
  scope :alphabetical, order('categories.name')

  # VALIDATIONS
  validates_presence_of :name

end
