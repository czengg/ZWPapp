class Project < ActiveRecord::Base

  # RELATIONSHIPS
  has_many :evidences
  belongs_to :company
  has_many :tags, :through => :evidences

  # SCOPES
  scope :active, where('projects.active = ?', true)
  scope :inactive, where('projects.active = ?', false)
  scope :alphabetical, order('projects.name')
  scope :by_company, joins(:company).order('name')
  scope :for_company, lambda {|companyID| where('companyID = ?', companyID)}

  # VALIDATIONS
  validates_presence_of :name, :companyID

end
