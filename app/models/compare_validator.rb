class CompareValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    cmp = record.attributes[options[:compare_to]].to_i
    case options[:type]
      when :greater_than
        record.errors.add(attribute, '는 지정된 항목보다 커야합니다.')unless value > cmp
      when :less_than
        record.errors.add(attribute, '는 지정된 항목보다 작아야합니다.')unless value < cmp
      when :equal
        record.errors.add(attribute, '는 지정된 항목과 같아야 합니다.')unless value == cmp
      else
        raise 'unknown type'
    end
  end
end
