class User < ActiveRecord::Base
  self.table_name = 'users'

  validates :username, presence: true, uniqueness: true, length: { minimum: 1 }
  validates :password, presence: true, length: { minimum: 1 }
end