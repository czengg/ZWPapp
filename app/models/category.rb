class Category < ActiveRecord::Base

  # CONSTANTS
  TYPES_OF_CATEGORIES = [['Collection & Diversion', 0], 
  						 ['Education & Communications', 1], 
  						 ['Purchasing', 2]]

  # RELATIONSHIPS

  # SCOPES
  
  # VALIDATIONS
  validates_presence_of :name

end
