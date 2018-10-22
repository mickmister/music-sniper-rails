class ApplicationController < ActionController::Base
  before_action :force_json
  skip_before_action :verify_authenticity_token

  def force_json
     request.format = :json
  end
end
