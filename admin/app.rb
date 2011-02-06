# -*- coding: utf-8 -*-
class Admin < Padrino::Application
  register Padrino::Mailer
  register Padrino::Helpers
  register Padrino::Admin::AccessControl

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
