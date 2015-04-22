class Api::V1::CommentsController < ApplicationController
	before_action :authenticate
	skip_before_filter :verify_authenticity_token
	
	def index
		@comments = Comment.all
		render json: @comments
	end


	def create
		@comment = Comment.new(comment_params)
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
			params.require(:comment).permit(:body, :user_id, :article_id)
		end

	protected
		def authenticate
			authenticate_or_request_with_http_token do |token, options|
				User.find_by(token: token)
				# Token.find_by(token: token)
			end
		end
		
end