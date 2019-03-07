class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Response
  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end
end
