class Tag < ApplicationRecord
  belongs_to :book
  validates :semester, presence: true
  validates :course, presence: true
  validates :others, presence: true
  validates :degree, presence: true
end
