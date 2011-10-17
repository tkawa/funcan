class Tweet
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include ActiveModel::MassAssignmentSecurity

  attr_accessor :text
  validates :text, length: 1..127

  def attributes=(values)
    sanitize_for_mass_assignment(values).each do |k, v|
      send("#{k}=", v)
    end
  end

  def initialize(attr)
    self.attributes = attr
  end

  def save
    if valid?
      Twitter.update(text, include_entities: true)
    else
      false
    end
  end
end