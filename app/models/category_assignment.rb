class CategoryAssignment < ActiveRecord::Base

  # RELATIONSHIPS
  belongs_to :category
  belongs_to :tag

  # SCOPES
  scope :by_category, joins(:category).order('name')
  scope :for_category, lambda {|category_id| where('category_id = ?', category_id)}
  scope :by_tag, joins(:tag).order('name')
  scope :for_tag, lambda {|tag_id| where('tag_id = ?', tag_id)}

  # VALIDATIONS
  validates_presence_of :tag_id, :category_id

end
