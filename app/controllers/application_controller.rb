class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  expose (:latest_posts) { Post.production.order('id DESC').last(8) }

  before_action :auth_token
  def auth_token
    @form_auth_token = form_authenticity_token
  end
end
