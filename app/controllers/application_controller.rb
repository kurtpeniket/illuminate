class ApplicationController < ActionController::Base
  # skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end

