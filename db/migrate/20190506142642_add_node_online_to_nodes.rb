# frozen_string_literal: true

class AddNodeOnlineToNodes < ActiveRecord::Migration[5.2]
  def change
    add_column :nodes, :node_online, :boolean, default: true
  end
end
