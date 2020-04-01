class User < ActiveRecord::Base
has_many :lists
has_many :items, through: :lists
validates :username, presence: true, uniqueness: true
has_secure_password
end
