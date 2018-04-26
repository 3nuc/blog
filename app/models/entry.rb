class Entry < ApplicationRecord
  belongs_to :blogbase, class_name: 'Blogbase'
  has_many :comments, dependent: :destroy
end
