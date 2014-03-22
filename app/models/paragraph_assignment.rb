class ParagraphAssignment < ActiveRecord::Base

  # RELATIONSHIPS
  belongs_to :paragraph
  belongs_to :report

  # SCOPES
  scope :active, where('paragraphs.active = ?', true)
  scope :inactive, where('paragraphs.active = ?', false)
  scope :by_report, joins(:report).order('name')
  scope :for_report, lambda {|report_id| where('report_id = ?', report_id)}
  scope :by_paragraph, joins(:paragraph).order('name')
  scope :for_paragraph, lambda {|paragraph_id| where('paragraph_id = ?', paragraph_id)}

  # VALIDATIONS
  validates_presence_of :report_id, :paragraph_id

end