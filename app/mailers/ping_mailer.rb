# frozen_string_literal: true

class PingMailer < ApplicationMailer
  default(from: 'SLK Pinger <ems@slk-lift.ru>')
  layout 'mailer'

  def bad_ping(node)
    receivers = User.where(receive_mails: true).pluck(:email)
    @node = node
    @node_history = node.node_pings.limit(100)

    mail(to: receivers, subject: "Bad response from #{node.title}")
  end
end
