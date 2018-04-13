class User < ApplicationRecord
  has_many :blogbases, dependent: :destroy
end
