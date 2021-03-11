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
 - EXPORT_DIR_NAME is optional argument
 - YOUR_REDEDASH_DATABASE_URL is like postgres://username:password@host:port/database

```sh
  bundle exec redash_backup YOUR_REDEDASH_DATABASE_URL EXPORT_DIR_NAME
  # export...
  #
  # Completed export to ./queries/dashboard1/hoge.sql
  # Completed export to ./queries/dashboard1/page.sql
  # Completed export to ./queries/dashboard2/poko.sql
  # Completed export to ./queries/dashboard2/pako.sql
  # Completed export to ./queries/unused/maru.sql
  # Completed export to ./queries/unused/batu.sql
  #
  # ※ default export path: './queries'
```
