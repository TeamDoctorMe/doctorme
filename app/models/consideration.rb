class Consideration < ApplicationRecord
  include AgeRange
  include Gender

  validates :title, presence: true
end
