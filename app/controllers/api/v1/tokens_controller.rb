class Api::V1::TokensController < ApplicationController
	require 'securerandom'

	def new
		@token = Token.new
	end

	def create
		@token = Token.new
		@token.token = SecureRandom.uuid.gsub(/\-/,'')
		@token.user_id = params[:user_id]
		@user = User.find(params[:user_id])
		puts "User token started marcela"
		puts @user.tokens.count

		if @user.tokens.count == 0
			if @token.save
				render json: {
					status: 200,
					message: @token.token
				}.to_json
			else
				render json: {
					status: 500,
					errors: @token.errors
				}.to_json
			end
		else
			render json: {
				status: 500,
				message: "This user already has a token"
			}.to_json
		end
	end

	# private
	# 	def token_params
	# 		params.require(:token).permit(:token)		
	# 	end
		
end