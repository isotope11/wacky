## Wacky

Wacky is an engine for Rails that aims to be the best wiki.  The end goal is to
have a drop-in wiki for any given Rails app.

### Installation

Add wacky to your Gemfile:

    gem 'wacky'

Mount wacky on your app:

    mount Wacky, at: '/wiki'

Copy the migrations and run them:

    rake wacky:install:migrations
    rake db:migrate
