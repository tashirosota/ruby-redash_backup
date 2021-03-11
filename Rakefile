require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "redash_backup"

RSpec::Core::RakeTask.new(:spec)

namespace :redash do
  task :query_backup, [:db_url, :export_dir] do |task, args|
    RedashBackup.new(args.db_url).execute(args.export_dir)
  end

  task :db_backup, [:db_url, :expoet_dir] do |task, args|
    RedashBackup.new(args.db_url).db_dump(args.export_dir)
  end
end