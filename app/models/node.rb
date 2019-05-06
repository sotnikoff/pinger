# frozen_string_literal: true

class Node < ApplicationRecord
  include Discard::Model

  has_many :node_pings, dependent: :destroy

  def ping
    check = Net::Ping::External.new(ip)
    result = check.ping
    NodePing.create(node: self, result: result)
    self.node_online = result
    save
    result
  end
end
