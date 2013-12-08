  module Authenticable
    extend ActiveSupport::Concern

    included do
      helper_method :current_user
    end

    def self.top_bar ( view, current_user, opts = {} )
      opts = {app:    "New App",
              logout: "Log Out",
              signup: "Sign Up",
              login:  "Login"}.merge(opts)

      view.content_tag :nav, class: "top-bar", "data-topbar" => "true" do
        content = []
        content << view.content_tag(:ul, class: "title-area") do
          view.content_tag :li, class: "name" do
            view.content_tag :h1 do
              view.link_to opts[:app], "#"
            end
          end
        end
        content << view.content_tag(:section, class: "top-bar-section") do
          view.content_tag :ul, class: "right" do
            inner = []
            if current_user
              inner << view.content_tag(:li) do
                view.link_to current_user.first_name, "#"
              end
              inner << view.content_tag(:li) do
                view.link_to opts[:logout], view.logout_path
              end
            else
              inner << view.content_tag(:li) do
                view.link_to opts[:signup], view.signup_path
              end
              inner << view.content_tag(:li) do
                view.link_to opts[:login], view.login_path
              end
            end
            inner.join.html_safe
          end
        end
        content.join.html_safe
      end
    end

    def authorize
      unless current_user
        session[:protected_page] = request.fullpath
        flash.now[:notice] = "Please login first"
        redirect_to login_url, alert: "Not authorized"
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

  end
