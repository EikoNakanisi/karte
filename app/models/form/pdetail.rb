class Form::Pdetail < Pdetail
  REGISTRABLE_ATTRIBUTES = %i(register plan_id kubun naiyo hyouka hyokad)
  attr_accessor :register
end