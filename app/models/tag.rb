class Tag < ActiveRecord::Base

	has_many :category_assignments
	has_many :tag_assignments
	has_many :projects, through: :evidences

	scope :by_evidence, ->(evidence_id) { joins(:tag_assignments).where("evidence_id = ?", evidence_id) }
	scope :not_by_evidence, ->(evidence_id) { joins(:tag_assignments).where("(tag_id = id and evidence_id != ?)", evidence_id) }

end
