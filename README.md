# RedashBackup

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
  RedashBackup.new('YOUR REDEDASH DATABASE_URL').execute('EXPORT DIR NAME')
```