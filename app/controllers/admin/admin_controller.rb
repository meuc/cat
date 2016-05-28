module Admin
  class AdminController < ApplicationController
    http_basic_authenticate_with name: "catlover", password: "123"
  end
end