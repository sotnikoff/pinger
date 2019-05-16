class AddAttemptsToNodePings < ActiveRecord::Migration[5.2]
  def change
    add_column :node_pings, :total_attempts, :integer, default: 0
    add_column :node_pings, :successful_attempts, :integer, default: 0
  end
end
