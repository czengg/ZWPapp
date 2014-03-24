class Paragraph < ActiveRecord::Base

  # RELATIONSHIPS
  has_many :paragraph_assignments
  belongs_to :report, :through => :paragraph_assignments

  # SCOPES
  scope :active, where('paragraphs.active = ?', true)
  scope :inactive, where('paragraphs.active = ?', false)
  scope :alphabetical, order('paragraphs.name')
  scope :by_report, joins(:report).order('name')
  scope :for_report, lambda {|report_id| where('report_id = ?', report_id)}

  # VALIDATIONS
  validates_presence_of :section_name, :body_text, :active, :report_id

end