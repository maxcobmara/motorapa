class Feedback < ApplicationRecord
  validates_presence_of :name,:email, :country, :comment
  validates :comment, length: { minimum: 8 }, allow_blank: false
end
