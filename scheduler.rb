
require 'rufus-scheduler'
require 'rake'

#Rufus::Scheduler.singleton.cron '0 08 * * 6' do
Rufus::Scheduler.singleton.every '10s' do
  p [ :run, :load_organizations, Time.now ]
  Rake.load_rakefile(File.join(__dir__, 'Rakefile'))
  Rake::Task['load_organizations'].invoke
end
Rufus::Scheduler.singleton.every '5s' do
  p [ :every_5s, Time.now ]
end

