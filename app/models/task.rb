class Task < ActiveRecord::Base #access to a number of methods

  validates :title, presence: true
  validates :body, presence: true
end
