class Account < ApplicationRecord
  has_many :users
  attr_accessor :owner_email
end
