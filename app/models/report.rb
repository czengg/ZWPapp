class Report < ActiveRecord::Base

  # RELATIONSHIPS
  has_many :paragraph_assignments
  belongs_to :project
  has_many :paragraphs, :through => :paragraph_assignments

  # SCOPES
  scope :active, where('reports.active = ?', true)
  scope :inactive, where('reports.active = ?', false)
  scope :alphabetical, order('reports.name')
  scope :by_project, joins(:project).order('name')
  scope :for_project, lambda {|project_id| where('project_id = ?', project_id)}

  # VALIDATIONS
  validates_presence_of :name, :project_id

end