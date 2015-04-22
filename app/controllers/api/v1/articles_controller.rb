class Api::V1::ArticlesController < ApplicationController
	before_action :authenticate, only:[:create]
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
	   


	
		
end