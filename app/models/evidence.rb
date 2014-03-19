class Evidence < ActiveRecord::Base

  # Relationships
  belongs_to :project
  has_many :tag_assignments
  has_attached_file :photo,
     :storage => :dropbox,
     :dropbox_credentials => {app_key: "q17euwadlzuvgwh", app_secret: "tzyzh8zccfsd2ks", access_token: "1hrf35bnv13399lv", access_token_secret: "eaduj4k7k6sjnm5", user_id: "278559598", access_type: "app_folder"}



  #scopes
  scope :by_project, ->(project_id) { where("project_id = ?", project_id) }
  scope :by_tag, ->(tag_id) { joins(:tag_assignments).where("tag_id = ?", tag_id) }

end
