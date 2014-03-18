class Project < ActiveRecord::Base

  # Relationships
  has_many :evidences
  belongs_to :company

end
