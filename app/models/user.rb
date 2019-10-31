class User < ActiveRecord::Base
  has_many :tasks
  has_secure_password

  validates :name, uniqueness: true
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true 
end
