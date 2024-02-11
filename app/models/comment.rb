class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :ad

  validates :text, presence: true

  attr_readonly :ad_id
end
