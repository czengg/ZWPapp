class Company < ActiveRecord::Base

  # Relationships
  has_many :projects
  has_many :clients

end
