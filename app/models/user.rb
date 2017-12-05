class User < ActiveRecord::Base
has_many :lists
has_many :items, through: :lists
validates_uniqueness_of :username
has_secure_password
end
