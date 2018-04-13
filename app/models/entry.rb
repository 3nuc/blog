class Entry < ApplicationRecord
  belongs_to :blogbase
  has_many :comments, dependent: :destroy
end
