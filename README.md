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
### With other than zsh
- YOUR_REDEDASH_DATABASE_URL is like postgres://username:password@host:port/db

```sh
  rake redash:backup[YOUR_REDEDASH_DATABASE_URL,EXPORT_DIR_NAME]
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
  # Can call without 'EXPORT DIR NAME'
  # ex. rake redash:backup['YOUR REDEDASH DATABASE_URL']
```

### With zsh

```sh
  ※ Surround with single quotes
  rake 'redash:backup[YOUR_REDEDASH_DATABASE_URL,EXPORT_DIR_NAME]'
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
