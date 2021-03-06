
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "redash_backup/version"

Gem::Specification.new do |spec|
  spec.name          = "redash_backup"
  spec.version       = RedashBackup::VERSION
  spec.authors       = ["Tashiro"]
  spec.email         = ["g4160hc@gmail.com"]

  spec.summary       = 'Simple tool for Redash\'s query backup'
  spec.description   = 'cli for back up redash queries'
  spec.homepage      = 'https://github.com/tashirosota/ruby-redash_backup'
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = 'https://github.com/tashirosota/ruby-redash_backup'
    spec.metadata["changelog_uri"] = 'https://github.com/tashirosota/ruby-redash_backup/blob/master/CHANGELOG.md'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "pg"
  spec.add_dependency "activerecord"
  spec.add_dependency "fileutils"
end
