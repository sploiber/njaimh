class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (
      options[:message] || "is not a valid phone number"
    ) unless
      value =~ /\(\d{3}\)\d{3}\-\d{4}/i
  end
end
