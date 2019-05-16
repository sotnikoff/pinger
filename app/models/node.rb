# frozen_string_literal: true

class Node < ApplicationRecord
  include Discard::Model

  has_many :node_pings, dependent: :destroy

  def ping
    check = Net::Ping::External.new(ip)
    attempts = 4
    results = []
    attempts.times do
      results << check.ping
    end
    successful_attempts = results.select { |p| p }.count
    result = successful_attempts > attempts / 2
    NodePing.create(node: self, result: result, total_attempts: attempts, successful_attempts: successful_attempts)
    self.node_online = result
    save
    result
  end
end
