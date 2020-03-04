require "redash_backup/version"
require "redash_backup/base"
require 'fileutils'

class RedashBackup
  def initialize(database_url)
    ENV['DATABASE_URL'] = database_url
  end

  def execute(dir = './queries')
    RedashBackup::Base.export!(dir)
  end

  class Error < StandardError; end
end
