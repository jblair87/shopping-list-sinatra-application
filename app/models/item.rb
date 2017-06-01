class Item < ActiveRecord::Base
  has_many :user_items
  has_many :users, through: :user_items
  has_many :categories, through: :item_categories
  has_many :item_categories
end
