class Company < ActiveRecord::Base

  # RELATIONSHIPS
  has_many :projects
  has_many :clients

  # SCOPES
  scope :alphabetical, order('companys.name')

  # VALIDATIONS
  validates_presence_of :name, :address, :zip
  validates_format_of :zip, :with => /^\d{5}$/, :message => "should be five digits long", :multiline => true

  # METHODS
  def current_clients
  	self.clients.active.select{|c| c.company_id == self.id}.uniq
  end

end
