result = ''
result << @books.attribute_names.join(',')
result << "\r"

@books.each do |b|
  result << b.attributes.values.join(',')
  result << "\r"
end

result.encode('EUC-KR')
