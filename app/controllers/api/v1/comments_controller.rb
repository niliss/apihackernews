class Api::V1::CommentsController < ApplicationController
	before_action :authenticate
	skip_before_filter :verify_authenticity_token
	
	def create
		@comment = Comment.new(	comment_params)
		if @comment.save
			render json: {
				status: 200,
				message: "Comment succesfully created.",
				comments: @comment
			}.to_json
		else
			render json: {
				status: 500,
				errors: @comment.errors
			}.to_json
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:body, :user_id, :article_id, :token)
		end

	protected
		def authenticate
			authenticate_or_request_with_http_token do |token, options|
				User.find(params[:user_id]).tokens[0].token
				# Token.find_by(token: token)
			end
		end
		def render_unauthorized
			self.headers['WWW-Authenticate'] = 'Token realm="Application"'
			render json: 'Bad credentials', status: 401
		end
end