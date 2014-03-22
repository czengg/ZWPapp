class Evidence < ActiveRecord::Base

  # RELATIONSHIPS
  belongs_to :project
  has_many :tag_assignments
  has_many :tags, :through => :tag_assignments
  has_many :categories, :through => :tags  
  
  accepts_nested_attributes_for :tag_assignments

  has_attached_file :photo,
     :storage => :dropbox,
     :dropbox_credentials => {app_key: "q17euwadlzuvgwh", app_secret: "tzyzh8zccfsd2ks", 
      access_token: "1hrf35bnv13399lv", access_token_secret: "eaduj4k7k6sjnm5", 
      user_id: "278559598", access_type: "app_folder"},
      :styles => { :medium => "300x300", :thumb => "100x100" },
      :dropbox_options => {
      :path => proc { |style| "#{style}/#{id}_#{photo.original_filename}" }
    }

  # SCOPES
  scope :alphabetical, order('evidences.name')
  scope :by_project, joins(:project).order('name')
  scope :for_project, lambda {|project_id| where('project_id = ?', project_id)}
  scope :active, where('evidences.active = ?', true)
  scope :inactive, where('evidences.active = ?', false)

  # VALIDATIONS
  validates_presence_of :name, :project_id
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validate :evidence_info_present?

  # METHODS
  def evidence_info_present?
  	if :description.blank? and :photo.blank?
  	  errors.add(:base, "You must include either a description or photo.")
  	end
  end

  # def tags
  #   tagIDArray = self.tag_assignments.map{|t| t.tag_id}.uniq
  #   tagIDArray.map{|i| Tag[i].name}
  # end

  private
  def recommendation_score_for_collection
    sum = 0
    self.tag_assignments.select{|t| t.category == 0}.each{|e| sum = sum+e }
  end

  def recommendation_score_for_education
    sum = 0
  end

  def recommendation_score_for_purchasing
    sum = 0
  end

end
