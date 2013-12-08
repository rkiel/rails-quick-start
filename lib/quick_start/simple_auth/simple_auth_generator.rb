module QuickStart
  class SimpleAuthGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def copy_user_model
      copy_file "user.rb", "app/models/user.rb"
    end

    def add_gem_files
      uncomment_lines "Gemfile", /bcrypt-ruby/
    end

    def copy_model_templates
      %w{home sessions users}.each do |name|
        copy_file "#{name}.js.coffee",      "app/assets/javascripts/#{name}.js.coffee"
        copy_file "#{name}.css.scss",       "app/assets/stylesheets/#{name}.css.scss"
        copy_file "#{name}_controller.rb",  "app/controllers/#{name}_controller.rb"
        copy_file "#{name}_helper.rb",      "app/helpers/#{name}_helper.rb"
      end
    end

    def update_application_controller
      inject_into_file "app/controllers/application_controller.rb", after: /protect_from_forgery.+?\n/m do
        "\n  include Authenticable\n"
      end
    end

    def update_views
      copy_file "home_index.html.erb",      "app/views/home/index.html.erb"
    end

    def update_layouts
      inject_into_file "app/views/layouts/application.html.erb", after: "<body>\n" do
        "    <%= Authenticable.top_bar(self, current_user, app: 'New App') %>\n"
      end
      copy_file "users_new.html.erb",      "app/views/users/new.html.erb"
      copy_file "sessions_new.html.erb",   "app/views/sessions/new.html.erb"
    end

    def update_config
      application "config.autoload_paths += %W(#{Rails.root}/lib)"
    end

    def update_routes
      route "root 'home#index'"
      route "get 'home/index'"
      route "resources :sessions"
      route "resources :users"
      route "get 'logout', to: 'sessions#destroy', as: 'logout'"
      route "get 'login',  to: 'sessions#new',     as: 'login'"
      route "get 'signup', to: 'users#new',        as: 'signup'"
    end

    def update_migrations
      copy_file "20131125013632_create_users.rb", "db/migrate/20131125013632_create_users.rb"
      copy_file "authenticable.rb", "lib/authenticable.rb"
    end
  end
end
