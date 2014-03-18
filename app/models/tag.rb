class Tag < ActiveRecord::Base

	has_many :category_assignments
	has_many :tag_assignments
	has_many :projects, through: :evidences

end
