class Tag < ActiveRecord::Base

  # RELATIONSHIPS
  has_many :category_assignments
  has_many :tag_assignments
  has_many :projects, through: :evidences

  # SCOPES
  scope :alphabetical, order('evidences.name')
  scope :by_evidence, => (evidenceID) { joins(:tag_assignments).where("evidenceID = ?", evidenceID) }
  scope :not_by_evidence, => (evidenceID) { joins(:tag_assignments).where("(tagID = id and evidenceID != ?)", evidenceID) }

  # VALIDATIONS
  validates_presence_of :name

end
