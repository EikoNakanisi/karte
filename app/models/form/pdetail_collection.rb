class Form::PdetailCollection < Form::Base
  DEFAULT_ITEM_COUNT = 5
  attr_accessor :pdetails

  def initialize(attributes = {})
    super attributes
    self.pdetails = DEFAULT_ITEM_COUNT.times.map { Form::Pdetail.new } unless pdetails.present?
  end

  def pdetails_attributes=(attributes)
    self.pdetails = attributes.map do |_, pdetail_attributes|
      Form::Pdetail.new(pdetail_attributes).tap { |v| v.availability = false }
    end
  end

  def valid?
    valid_pdetails = target_pdetails.map(&:valid?).all?
    super && valid_pdetails
  end

  def save
    return false unless valid?
    Pdetail.transaction { target_pdetails.each(&:save!) }
    true
  end

  def target_pdetails
    self.pdetails.select { |v| value_to_boolean(v.register) }
  end
end
