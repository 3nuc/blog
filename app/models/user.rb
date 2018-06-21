class User < ApplicationRecord
  has_many :blogbases, class_name: 'Blogbase', dependent: :destroy
end
