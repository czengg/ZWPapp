class Tag < ActiveRecord::Base

  # RELATIONSHIPS
  has_many :category_assignments
  has_many :tag_assignments
  has_many :projects, through: :evidences

  # SCOPES
  scope :alphabetical, order('evidences.name')

  # VALIDATIONS
  validates_presence_of :name

end
