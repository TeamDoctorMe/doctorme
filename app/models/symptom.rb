class Symptom < ApplicationRecord
  include AgeRange
  include Gender

  belongs_to :parent, required: false, class_name: 'Symptom'
  belongs_to :diagnosis, required: false

  has_many :symptoms, foreign_key: 'parent_id'

  scope :base, -> { where(parent_id: nil) }

  validates :title, presence: true

  def level
    level = 1
    level += parent.level if parent
    level
  end

  def nested_class
    "nested nested-#{level}x"
  end

  def hierarchy_tree
    group = Array.new

    if parent.present?
      group = parent.hierarchy_tree.push(parent)
      # group = group.push(parent.hierarchy_tree) if parent.hierarchy_tree.present?
    end
    
    group
  end

end
