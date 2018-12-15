class NodePing < ApplicationRecord
  belongs_to :node

  default_scope { order('created_at DESC') }
  scope :failed, -> { where(result: false) }
  scope :today, -> { where(created_at: Time.current.beginning_of_day...Time.current.end_of_day) }
end
