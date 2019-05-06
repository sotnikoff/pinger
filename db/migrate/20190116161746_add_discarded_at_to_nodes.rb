# frozen_string_literal: true

class AddDiscardedAtToNodes < ActiveRecord::Migration[5.2]
  def change
    add_column :nodes, :discarded_at, :datetime
    add_index :nodes, :discarded_at
  end
end
