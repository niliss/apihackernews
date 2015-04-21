class Api::V1::UsersController < ApplicationController

	def index
	  @users = User.all
	  render json: @users
	end

	def show
		@user = User.find(params[:id])
		@articles = Article.where(user_id: @user.id)
		render json: @articles
	end

end
