module AgeRange
  extend ActiveSupport::Concern

  included do
    validates :age_max, numericality: { greater_than: :age_min, allow_blank: true }
    
    scope :within_age_range, -> (age) { where('age_min <= ? AND age_max >= ?', age, age) }
  end
end
