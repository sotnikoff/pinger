# frozen_string_literal: true

class AddReceiveMailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :receive_mails, :boolean, default: false
  end
end
