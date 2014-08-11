class User < ActiveRecord::Base

  has_and_belongs_to_many :projects
  has_many :tasks
  
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

end
