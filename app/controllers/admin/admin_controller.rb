module Admin
  # Admin autentification
  class AdminController < ApplicationController
    http_basic_authenticate_with name: ENV.fetch("admin_username"), password: ENV.fetch("admin_password")
  end
end