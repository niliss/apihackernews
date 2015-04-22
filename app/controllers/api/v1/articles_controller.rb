class Api::V1::ArticlesController < ApplicationController
before_action :authenticate
skip_before_filter :verify_authenticity_token
	
	def create
		@article = Article.new(article_params)
		if @article.save
			render json: {
				status: 200,
				message: "Article succesfully created.",
				articles: @article
			}.to_json
		else
			render json: {
				status: 500,
				errors: @article.errors
			}.to_json
		end
	end

	private
		def article_params
			params.require(:article).permit(:title, :body, :user_id)
		end

	protected
		def authenticate
			authenticate_or_request_with_http_token do |token, options|
				User.find_by(token: token)
				# Token.find_by(token: token)
			end
		end
		
end