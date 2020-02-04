class User < ActiveRecord::Base #access to a number of methods
  has_many :tasks
  has_secure_password #Access to methods  

  validates :name, uniqueness: true
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true
end
