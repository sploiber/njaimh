class PhoneValidator < ActiveModel::EachValidator
  # It is OK to have a null phone, but nothing else is OK
  def validate_each(record, attribute, value)
    record.errors[attribute] << (
      options[:message] || "is not a valid phone number"
    ) unless
      (value == "") || (value =~ /\(\d{3}\)\s+\d{3}\-\d{4}/i)
  end
end
