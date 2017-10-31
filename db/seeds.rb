names = []


Item.all.each do |item|
  if names.include?(item.name)
    item.destroy
  else
    names.push(item.name)
  end
  if item.name == "" || item.blank? || item.name.nil?
  item.destroy
  end
  # puts item.inspect
end
