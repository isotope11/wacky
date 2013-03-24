## Wacky
[![Build Status](https://travis-ci.org/isotope11/wacky.png?branch=master)](https://travis-ci.org/isotope11/wacky)

Wacky is an engine for Rails that aims to be the best wiki.  The end goal is to
have a drop-in wiki for any given Rails app.

Features:

- versioning
- realtime markdown preview
- title extraction
- keyboard shortcuts
  - `e` to edit the current page
  - `v` to see the versions
  - `?` to see the help
  - `ESC` to hide the help

### Installation

Add wacky to your Gemfile:

```ruby
gem 'wacky'
```

Mount wacky on your app:

```ruby
mount Wacky::Engine, at: "/wiki"
```

Copy the migrations and run them:

    rake wacky:install:migrations
    rake db:migrate

NOTE: Wacky will set an instance variable, `@wacky_title`, that has the title of the page you're on.  It extracts this by finding the first heading element (h1, h2, h3, h4, h5, h6) on the page.  If you want to include that in your layout title, you're welcome to.

### Development

To run the tests:

    rake
