class Diagnosis < ApplicationRecord

  enum gender: { both: 0, male: 1, female: 0 }

  validates :title,       presence: true
  validates :description, presence: true
end
