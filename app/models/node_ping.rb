class NodePing < ApplicationRecord
  belongs_to :node

  default_scope { order('created_at DESC') }
end
