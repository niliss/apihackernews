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

	def create
		@article = Article.new(user_params)
		if user.save
			head 200
		else
			head 500
		end
	end

	private

		def user_params
			params.require(:user).permit(:name, :username, :email)
		end
end
