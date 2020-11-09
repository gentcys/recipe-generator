class Recipe < ApplicationRecord
  validates_presence_of :name, :description
  validates :time, presence: true, numericality: { only_integer: true, less_than_or_equal_to: ActiveSupport::Duration::SECONDS_PER_WEEK / ActiveSupport::Duration::SECONDS_PER_MINUTE }
  validates :difficulty, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5 }
  validates_length_of :name, maximum: 255, allow_blank: false
  validates_length_of :description, maximum: 1000, allow_blank: false

  default_scope { order(:id) }
  scope :name_liked, ->(keyword) { where('name LIKE?', "%#{keyword}%") }

  paginates_per 10
end
