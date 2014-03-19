class TagAssignment < ActiveRecord::Base

	belongs_to :evidence
	belongs_to :tag

end
