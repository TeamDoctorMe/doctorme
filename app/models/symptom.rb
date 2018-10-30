class Symptom < ApplicationRecord
  include AgeRange
  include Gender

  belongs_to :parent, required: false, class_name: 'Symptom'
  belongs_to :diagnosis, required: false

  has_many :symptoms, foreign_key: 'parent_id'

  scope :base, -> { where(parent_id: nil) }

  validates :title, presence: true

  def nested_class
    if parent.present? and parent.parent.present?
      'nested nested-2x'
    elsif parent.present?
      'nested'
    end
  end

end
