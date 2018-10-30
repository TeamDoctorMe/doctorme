module AgeRange
  extend ActiveSupport::Concern

  included do
    validates :age_max, numericality: { greater_than: :age_min }
  end
end
