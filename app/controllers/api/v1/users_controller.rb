class Api::V1::UsersController < ApplicationController
  require 'securerandom'
  # before_create :set_auth_token


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

		if @user.tokens.count == 0
			render json: @user.tokens.create(token: SecureRandom.uuid.gsub(/\-/,'')), status: 200
		else
			token = SecureRandom.uuid.gsub(/\-/,'')
			@user.tokens.first.update(token: token)
			render json: {
				status: 200,
				token: token
			}.to_json
		end
	
	end

	private

		def user_params
			params.require(:user).permit(:name, :username, :email)
		end

end