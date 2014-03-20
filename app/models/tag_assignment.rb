class TagAssignment < ActiveRecord::Base

  # CONSTANTS
  TAG_RATING_SECTION =  [["Plastic Containers",-100,"1.A"],
                        ["Glass Containers",-100,"1.A"],
                        ["Metal Containers",-100,"1.A"],
                        ["Corrugated Cardboard",-100,"1.B"],
                        ["Food Waste",20,"1.1"],
                        ["90% Diversion Rate",25,"1.2"],
                        ["Cooking Oil",10,"1.3"],
                        ["Film Plastic",5, "1.4"],
                        ['E-Waste',15,'1.5'],
                        ['Unwanted Materials',10,'1.6'],
                        ['Diverted and Landfilled Materials',-100,'2.A'],
                        ['Descriptive Signage',-100,'2.B'],
                        ['Waste minimization/Recycling Policy',-100,'2.C'],
                        ['Education Singage',15,'2.1'],
                        ['Orientation Program',20,'2.2'],
                        ['Continuing Education Program',20,'2.3'],
                        ['Formalized Waste Reduction Support',25,'2.4'],
                        ['Recycling Coordinator',10,'2.4'],
                        ['Green Team',25,'2.4'],
                        ['Collection/Cleanup Event',15,'2.5'],
                        ['Post-consumer recycled content paper',10,'3.1'],
                        ['Buy-Recycled Policy',20,'3.2'],
                        ['Single use beverage contained elimination',5,'3.3'],
                        ['Readibly Recyclable Serviceware',5,'3.4'],
                        ['Recycled Content Serviceware',10,'3.4'],
                        ['Compostable Serviceware',15,'3.4'],
                        ['Durable & Reusable Serviceware',40,'3.4'],
                        ['Double Sided Printing',5,'4.1'],
                        ['Other Programs',15,'4.2'],
                      ]

  # RELATIONSHIPS
  belongs_to :evidence
  belongs_to :tag

  # SCOPES
  scope :by_evidence, joins(:evidence).order('name')
  scope :for_evidence, lambda {|evidence_id| where('evidence_id = ?', evidence_id)}
  scope :by_tag, joins(:tag).order('name')
  scope :for_tag, lambda {|tag_id| where('tag_id = ?', tag_id)}

  # VALIDATIONS
  validates_presence_of :rating, :tag_id, :evidence_id

  # METHODS
  def category
    self.tag.category
  end

end
