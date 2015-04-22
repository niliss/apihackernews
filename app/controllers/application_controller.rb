class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

    def authenticate
			authenticate_or_request_with_http_token do |token, options|
				User.find_by(token: token)
				# Token.find_by(token: token)
				User.destroy
				@rate = User.rate_limit(token)
				if @rate == true
					render json: {
					status: 411,
					message: "Rate exceeded"
				}.to_json
				else 
				Request.create(token: token)
				end
			end
	end

end
