class SearchHistory < ApplicationRecord
  default_scope { order(:id) }

  belongs_to :user
end
