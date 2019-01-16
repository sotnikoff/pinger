class NodePing < ApplicationRecord

  belongs_to :node

  default_scope { order('created_at DESC') }
  scope :failed, -> { where(result: false) }
  scope :yesterday, lambda {
    yesterday = Time.current - 1.day
    where(created_at: yesterday.beginning_of_day...yesterday.end_of_day)
  }

end
