class Evidence < ActiveRecord::Base

  # Relationships
  belongs_to :project
  has_many :tag_assignments

end
