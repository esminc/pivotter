class Admin < Padrino::Application
  register Padrino::Mailer
  register Padrino::Helpers
  register Padrino::Admin::AccessControl

  ##
  # Application-specific configuration options
  #
  # set :raise_errors, true     # Show exceptions (default for development)
  # set :public, "foo/bar"      # Location for static assets (default root/public)
  # set :sessions, false        # Enabled by default
  # set :reload, false          # Reload application files (default in development)
  # set :default_builder, "foo" # Set a custom form builder (default 'StandardFormBuilder')
  # set :locale_path, "bar"     # Set path for I18n translations (default your_app/locales)
  # disable :padrino_helpers    # Disables padrino markup helpers (enabled by default if present)
  # disable :padrino_mailer     # Disables padrino mailer (enabled by default if present)
  # disable :flash              # Disables rack-flash (enabled by default)
  # enable  :authentication     # Enable padrino-admin authentication (disabled by default)
  # layout  :my_layout          # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
  #

  set :login_page, "/admin/sessions/new"
  disable :store_location

  access_control.roles_for :any do |role|
    role.protect "/"
    role.allow "/sessions"
  end

  access_control.roles_for :admin do |role|
    role.project_module :accounts, "/accounts"
    role.project_module :projects, "/projects"
  end
end
