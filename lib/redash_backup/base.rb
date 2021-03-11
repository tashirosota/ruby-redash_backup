class RedashBackup::Base
  def self.export!(dir)
    new(dir).export
  end

  def initialize(dir)
    @dir = dir
    require 'redash_backup/model'
  end

  def export
    FileUtils.rm_r(@dir) if Dir.exist? @dir
    Dir.mkdir(@dir)
    Dashboard.active.all.find_each { |board| export_by_board!(board) }
    export_unused_queries!
  end

  private

  def export_by_board!(board)
    board_name = board.name.gsub('/', '_')
    Dir.mkdir(@dir + '/' + board_name)
    board.widgets.each do |widget|
      query = widget.visualization&.query
      next unless query

      text = <<~TEXT
        -- #{board_name}
        -- #{query.name}
        -- #{Time.now.strftime('%Y/%m/%d %H:%M')}

        #{query.query}
      TEXT
      File.open(@dir + "/#{board_name}/#{query.name.gsub('/', '_')}.sql", 'w') do |file|
        file.puts text
      end
    end
    puts "Completed export to #{@dir}/#{board_name}/*.sql"
  end

  # unused: queries not attach to dashboard
  def export_unused_queries!
    Dir.mkdir(@dir + '/unused')
    Query.inactive.all.find_each do |query|
      text = <<~TEXT
        -- ※ Not attached to dashboard
        -- is_draft: #{query.is_draft}
        -- #{Time.now.strftime('%Y/%m/%d %H:%M')}

        #{query.query}
      TEXT
      File.open(@dir + "/unused/#{query.name.gsub('/', '_')}.sql", 'w') do |file|
        file.puts text
      end
    end
    puts "Completed export to #{@dir}/unused/*.sql"
  end
end
