class Project < ActiveRecord::Base

  # CONSTANTS 
  SUMMARY_SECTIONS = Hash.new

  # RELATIONSHIPS
  has_many :evidences
  belongs_to :company
  has_many :tag_assignments, :through => :evidences
  has_many :tags, :through => :evidences
  has_many :reports
  has_many :paragraphs, :through => :reports

  # SCOPES
  scope :active, where('projects.active = ?', true)
  scope :inactive, where('projects.active = ?', false)
  scope :alphabetical, order('projects.name')
  scope :by_company, joins(:company).order('name')
  scope :for_company, lambda {|company_id| where('company_id = ?', company_id)}

  # VALIDATIONS
  validates_presence_of :name, :company_id

  before_save :populate_hash

  # METHODS
  def populate_hash
    SUMMARY_SECTIONS['1.A'] = 'Provide for the collection and recycling of plastic, glass, and metal containers'
    SUMMARY_SECTIONS['1.B'] = 'Provide for collection and recycling of corrugated cardboard'
    SUMMARY_SECTIONS['1.1'] = 'Provide for collection and composting of food waste'
    SUMMARY_SECTIONS['1.2'] = 'Achieve a diversion rate of 90% or greater as measured by weight'
    SUMMARY_SECTIONS['1.3'] = 'Provide for collection and reuse of cooking oil'
    SUMMARY_SECTIONS['1.4'] = 'Provide for collection and recycling of film plastic'
    SUMMARY_SECTIONS['1.5'] = 'Provide for collection and recycling of batteries, fluorescent bulbs, appliances, printer/toner cartridges and any other e-waste'
    SUMMARY_SECTIONS['1.6'] = 'Donate useable office furniture, construction materials, durable goods, and other unwanted/unneeded materials to local non-profits'
    SUMMARY_SECTIONS['2.A'] = 'Measure & track quantities of diverted and landfilled materials'
    SUMMARY_SECTIONS['2.B'] = 'Provide & install descriptive signage'
    SUMMARY_SECTIONS['2.C'] = 'Develop an official waste minimization/recycling policy'
    SUMMARY_SECTIONS['2.1'] = 'Provide in-depth educational signage/posters on the importance of waste minimization to employees & vistors'
    SUMMARY_SECTIONS['2.2'] = 'Integrate edUcation on waste minimization programs into new and existing employee or student training/orientation'
    SUMMARY_SECTIONS['2.3'] = 'Develop continuing education program or curriculum on waste reduction and other environmental topics'
    SUMMARY_SECTIONS['2.4'] = 'Formalize support for waste reduction or greening efforts'
    SUMMARY_SECTIONS['2.4'] = 'Designate a recylcing coordinator'
    SUMMARY_SECTIONS['2.4'] = 'Designate and empower a Green Team'
    SUMMARY_SECTIONS['2.5'] = 'Sponsor or participate in a collection or cleanup event in your community'
    SUMMARY_SECTIONS['3.1'] = 'Purchase 30% or greater post-consumer recycled content paper'
    SUMMARY_SECTIONS['3.2'] = 'Institute a buy-recycled policy for all non-paper materials and supplies'
    SUMMARY_SECTIONS['3.3'] = 'Limit the number or eliminate the use of single use beverage containers'
    SUMMARY_SECTIONS['3.4'] = 'Utilize serviceware that is exclusively readily recyclable (Plastics #1 & #2)'
    SUMMARY_SECTIONS['3.4'] = 'Utilize serviceware that is exclusively made with recycled content (minimum 50% pre- or post-consumer)'
    SUMMARY_SECTIONS['3.4'] = 'Utilize serviceware that is exclusively compostable (points awarded only if composting program is instituted)'
    SUMMARY_SECTIONS['3.4'] = 'Utilize serviceware that is exclusively durable & reusable (ceramic, china, glass, etc.)'
    SUMMARY_SECTIONS['4.1'] = 'Institute double-sided printing'
    SUMMARY_SECTIONS['4.2'] = 'Programs or actions that have a meaningful impact not rewarded elsewhere (subject to approval by ZWP evaluator)'
  end

  def evidence_for_category(category_id)
    self.tag_assignments.select{ |t| t.tag.category_id == category_id }
  end

  def all_sections_for_project(category_id)
    self.evidence_for_category(category_id).map{ |t| t.tag.section }.uniq
  end

  def all_evidence_for_section(section)
    self.tag_assignments.select{ |t| t.tag.section == section }
  end

  def section_name(section)
    populate_hash
    SUMMARY_SECTIONS[section]
  end
end
