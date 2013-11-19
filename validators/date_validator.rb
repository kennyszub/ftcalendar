class DateValidator < ActiveModel::EachValidator
  def validate_each(record, attr_name, value)
    unless record.starts_at < record.ends_at
      record.errors.add(attr_name, :starts_at, options.merge(:value => value))
    end
  end
end

module ActiveModel::Validations::HelperMethods
  def validates_date(*attr_names)
    validates_with DateValidator, _merge_attributes(attr_names)
  end
end