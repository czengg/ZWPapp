class Evidence < ActiveRecord::Base

  # RELATIONSHIPS
  belongs_to :project
  has_many :tag_assignments
  has_many :tags, :through => :tag_assignments  

  has_attached_file :photo,
     :storage => :dropbox,
     :dropbox_credentials => {app_key: "q17euwadlzuvgwh", app_secret: "tzyzh8zccfsd2ks", 
      access_token: "1hrf35bnv13399lv", access_token_secret: "eaduj4k7k6sjnm5", 
      user_id: "278559598", access_type: "app_folder"}

  # SCOPES
  scope :alphabetical, order('evidences.name')
  scope :by_project, joins(:project).order('name')
  scope :for_project, lambda {|project_id| where('project_id = ?', project_id)}

  # VALIDATIONS
  validates_presence_of :name, :project_id
  validate :evidence_info_present?

  # METHODS
  def contact_info_present?
  	if :description.blank? and :photo.blank?
  	  errors.add(:base, "You must include either a description or photo.")
  	end
  end

end
