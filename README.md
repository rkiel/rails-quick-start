# Rails::Quick::Start

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'rails-quick-start', group: [:development], git: 'https://github.com/rkiel/rails-quick-start.git'

And then execute:

    bundle install

To list all the availables generators. Look for the QuickStart section.

    bundle exec rails generate

To quick start Foundation:

    bundle exec rails generate quick_start:foundation

Here's the output:

    gemfile  foundation-rails (~> 5.1.1.0)
      insert  app/assets/javascripts/application.js
      insert  app/assets/javascripts/application.js
      insert  app/assets/stylesheets/application.css
      create  app/assets/stylesheets/foundation_and_overrides.scss
    conflict  app/views/layouts/application.html.erb
       force  app/views/layouts/application.html.erb

Now install the Foundation gem:

     bundle install

Add all the file changes and commit.

To quick start simple authentication:

    bundle exec rails generate quick_start:simple_auth

Here's the output:

      create  app/models/user.rb
        gsub  Gemfile
      create  app/assets/javascripts/home.js.coffee
      create  app/assets/stylesheets/home.css.scss
      create  app/controllers/home_controller.rb
      create  app/helpers/home_helper.rb
      create  app/assets/javascripts/sessions.js.coffee
      create  app/assets/stylesheets/sessions.css.scss
      create  app/controllers/sessions_controller.rb
      create  app/helpers/sessions_helper.rb
      create  app/assets/javascripts/users.js.coffee
      create  app/assets/stylesheets/users.css.scss
      create  app/controllers/users_controller.rb
      create  app/helpers/users_helper.rb
      insert  app/controllers/application_controller.rb
      create  app/views/home/index.html.erb
      insert  app/views/layouts/application.html.erb
      create  app/views/users/new.html.erb
      create  app/views/sessions/new.html.erb
       route  root 'home#index'
       route  get 'home/index'
       route  resources :sessions
       route  resources :users
       route  get 'logout', to: 'sessions#destroy', as: 'logout'
       route  get 'login',  to: 'sessions#new',     as: 'login'
       route  get 'signup', to: 'users#new',        as: 'signup'
      create  db/migrate/20131125013632_create_users.rb
      create  lib/authenticable.rb

Now update the gems:

     bundle install

Run the migrations:

     rake db:migrate

Run the server

     rails server


