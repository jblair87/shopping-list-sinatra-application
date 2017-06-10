class User < ActiveRecord::Base
has_many :categories
has_many :items, through: :categories
   has_secure_password
end
