class Admin < ApplicationRecord
  has_secure_password
  has_many :projects

  validates_uniqueness_of :name
  validates_presence_of :name

  def self.authenticate!(email, password)
    admin = self.find_by(:email => email)
    admin.authenticate(password) if admin
  end
end
