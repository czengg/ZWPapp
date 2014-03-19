class CategoryAssignment < ActiveRecord::Base

  # RELATIONSHIPS
  belongs_to :category
  belongs_to :tag

  # SCOPES
  scope :by_category, joins(:category).order('name')
  scope :for_category, lambda {|categoryID| where('categoryID = ?', categoryID)}
  scope :by_tag, joins(:tag).order('name')
  scope :for_tag, lambda {|tagID| where('tag_id = ?', tagID)}

  # VALIDATIONS
  validates_presence_of :tagID, :categoryID

end
