# frozen_string_literal: true

class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.string :title
      t.string :ip
      t.text :description
      t.integer :ems_id
      t.boolean :check

      t.timestamps
    end
  end
end
