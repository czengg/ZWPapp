class Category < ActiveRecord::Base

  # CONSTANTS
  TYPES_OF_CATEGORIES = [['Collection & Diversion', 0], 
  						 ['Education & Communications', 1], 
  						 ['Purchasing', 2]]

  # RELATIONSHIPS

  # SCOPES
  scope :alphabetical, order('categories.name')
  scope :active, where('categories.active = ?', true)
  scope :inactive, where('categories.active = ?', false)
  
  # VALIDATIONS
  validates_presence_of :name

end
