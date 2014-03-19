class Client < ActiveRecord::Base

  # CALLBACKS
  before_save :reformat_phone

  # RELATIONSHIPS
  belongs_to :company
  belongs_to :project, :through => :company

  # SCOPES
  scope :alphabetical, order('clients.name')
  scope :by_company, joins(:company).order('name')
  scope :for_company, lambda {|company_id| where('company_id = ?', company_id)}

  # VALIDATIONS
  validates_presence_of :name, :company_id
  validates_format_of :phone, :with => /^\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}$/, :message => "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => true
  validate :contact_info_present?

  # METHODS
  def contact_info_present?
  	if :phone.blank? and :email.blank?
  	  errors.add(:base, "You must include one form of contact")
  	end
  end

  # PRIVATE METHODS 
  private
  def reformat_phone
    phone = self.phone.to_s  # change to string in case input as all numbers 
    phone.gsub!(/[^0-9]/,"") # strip all non-digits
    self.phone = phone       # reset self.phone to new string
  end

  def generate_recommendations
    
  end


end
