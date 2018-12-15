require 'csv'

desc 'Daily csv report'

task daily_report: :environment do
  CSV.open("#{ENV['FOLDER']}/report_#{I18n.l(Time.current, format: :file)}.csv", 'wb') do |csv|
    csv << %w[Name Pings Errors]
    Node.where(check: true).find_each do |node|
      csv << [node.title, node.node_pings.today.count, node.node_pings.failed.today.count]
    end
  end
end
