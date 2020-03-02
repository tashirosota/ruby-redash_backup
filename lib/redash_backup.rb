require "redash_backup/version"
require 'fileutils'

class RedashBackup
  def initialize(database_url)
    ENV['DATABASE_URL'] = database_url
    require "redash_backup/model"
  end

  def execute(dir = './queries')
    boards = Dashboard.active.all
    FileUtils.rm_r(dir) if Dir.exist? dir
    Dir.mkdir(dir)
    boards.each do |board|
      Dir.mkdir(dir + '/' + board.name)
      board.widgets.each do |widget|
        query = widget.visualization&.query
        next unless query

        text = <<~TEXT
          -- #{board.name}
          -- #{query.name}
          -- #{Time.now.strftime('%Y/%m/%d %H:%M')}

          #{query.query}
        TEXT
        File.open(dir + "/#{board.name}/#{query.name.gsub('/', '_')}.sql", 'w') do |file|
          file.puts text
        end
      end
      puts "Completed export to #{dir}/#{board.name}/*.sql"
    end
  end

  class Error < StandardError; end
end
