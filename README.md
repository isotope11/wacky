## Wacky
[![Build Status](https://travis-ci.org/isotope11/wacky.png?branch=master)](https://travis-ci.org/isotope11/wacky)

Wacky is an engine for Rails that aims to be the best wiki.  The end goal is to
have a drop-in wiki for any given Rails app.

Features:

- versioning
- realtime markdown preview

### Installation

Add wacky to your Gemfile:

```ruby
gem 'wacky'
```

Mount wacky on your app:

```ruby
mount Wacky, at: '/wiki'
```

Copy the migrations and run them:

    rake wacky:install:migrations
    rake db:migrate

### Development

To run the tests:

    rake
