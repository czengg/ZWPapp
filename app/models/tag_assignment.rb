class TagAssignment < ActiveRecord::Base

  # CONSTANTS
  RATING_SCORES = [['Bad', -1], ['Neutral', 0], ['Good', 1]]

  # RELATIONSHIPS
  belongs_to :evidence
  belongs_to :tag

  # SCOPES
  scope :by_evidence, joins(:evidence).order('name')
  scope :for_evidence, lambda {|evidence_id| where('evidence_id = ?', evidence_id)}
  scope :by_tag, joins(:tag).order('name')
  scope :for_tag, lambda {|tag_id| where('tag_id = ?', tag_id)}

  # VALIDATIONS
  validates_presence_of :rating, :tag_id, :evidence_id

end
