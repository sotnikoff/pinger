# frozen_string_literal: true

desc 'Ping node'

task ping: :environment do
  Node.where(check: true).each do |node|
    old_result = node.node_online?
    node.ping

    PingMailer.bad_ping(node).deliver_now if old_result && !node.node_online?
  end
end
