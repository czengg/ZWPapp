class TagAssignment < ActiveRecord::Base

  # CONSTANTS
  RATING_SCORES = [['Bad', -1], ['Neutral', 0], ['Good', 1]]

  # RELATIONSHIPS
  belongs_to :evidence
  belongs_to :tag

  # SCOPES
  scope :by_evidence, joins(:evidence).order('name')
  scope :for_evidence, lambda {|evidenceID| where('evidenceID = ?', evidenceID)}
  scope :by_tag, joins(:tag).order('name')
  scope :for_tag, lambda {|tagID| where('tagID = ?', tagID)}

  # VALIDATIONS
  validates_presence_of :rating, :tagID, :evidenceID

  # METHODS
  def category
    self.tag.category
  end

end
