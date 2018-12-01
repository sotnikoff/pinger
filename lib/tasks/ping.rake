desc 'Ping node'

task ping: :environment do
  Node.where(check: true).find_each(&:ping)
end
