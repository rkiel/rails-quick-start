module QuickStart
  class FoundationGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def add_gem_files
      gem 'foundation-rails', version: '~> 5.2.2.0'
    end

    def update_application_assets
      inject_into_file "app/assets/javascripts/application.js", after: "//= require jquery_ujs\n" do
        "//= require foundation\n"
      end
      inject_into_file "app/assets/javascripts/application.js", after: "//= require_tree .\n" do
        blurb = <<-END

  $(function(){ $(document).foundation(); });
        END
      end

      inject_into_file "app/assets/stylesheets/application.css", after: " *= require_self\n" do
        " *= require foundation_and_overrides\n"
      end
    end

    def copy_model_templates
      copy_file "foundation_and_overrides.scss", "app/assets/stylesheets/foundation_and_overrides.scss"
    end

    def update_layouts
      copy_file "application.html.erb", "app/views/layouts/application.html.erb"
    end
  end
end
