# frozen_string_literal: true

class CreateNodePings < ActiveRecord::Migration[5.2]
  def change
    create_table :node_pings do |t|
      t.references :node, foreign_key: true
      t.boolean :result

      t.timestamps
    end

    add_index :node_pings, :created_at
  end
end
