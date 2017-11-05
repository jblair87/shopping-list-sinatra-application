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

List.all.each do |list|
  if names.include?(list.name)
    list.destroy
  else
    names.push(list.name)
  end
  if list.name == "" || list.blank? || list.name.nil?
  list.destroy
  end
#puts list.inspect
end
