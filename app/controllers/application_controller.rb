class ApplicationController < ActionController::Base

  # exception stuff from ActiveAdmin
  # protect_from_forgery with: :exception

  protect_from_forgery with: :null_session

  include Response
  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end
end
