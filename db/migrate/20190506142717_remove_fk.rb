# frozen_string_literal: true

class RemoveFk < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key 'node_pings', 'nodes'
  end
end
