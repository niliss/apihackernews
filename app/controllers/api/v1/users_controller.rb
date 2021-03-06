class Api::V1::UsersController < ApplicationController
  require 'securerandom'
  # before_create :create_token


	def index
	  @users = User.all
	  render json: @users
	end

	def show
		@user = User.find(params[:id])
		@articles = Article.where(user_id: @user.id)
		render json: @articles
	end

	# def create
	# 	@user = User.new(user_params)
	# 	if @user.save
	# 		head 200
	# 	else
	# 		head 500
	# 	end
	# end

	def create_token
		@user = User.find(params[:user_id])
		token = SecureRandom.uuid.gsub(/\-/,'')
			@user.update(token: token)
			@user.save
			render json: {
				status: 200,
				token: token
			}.to_json

	
	end

	private

		def user_params
			params.require(:user).permit(:name, :username, :email)
		end

end