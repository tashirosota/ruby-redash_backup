# RedashBackup

Simple Redash's query backup tool

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'redash_backup'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redash_backup

## Usage

```
  require 'redash_backup'
  RedashBackup.new('YOUR REDEDASH DATABASE_URL').execute('EXPORT DIR NAME')
  #
  # export...
  #
  # ./queries/dashboard1/hoge.sql
  # ./queries/dashboard1/page.sql
  # ./queries/dashboard2/poko.sql
  # ./queries/dashboard2/pako.sql
  # ./queries/unused/maru.sql
  # ./queries/unused/batu.sql
  #
  # ※ default export path: './queries'
  # 
```