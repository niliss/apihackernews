class User < ActiveRecord::Base
	has_many :articles
	has_many :comments
	has_many :tokens

	def self.rate_limit(token)
			@rates_allowed = 2
			if Request.where(token: token).count >= @rates_allowed
				return true
			else
				return false
			end
	end
	
	def self.destroy
		@history = (Time.now - 1.year)
		@after = (Time.now - 1.minute)
		@select = Request.where(created_at: @after..Time.now)
		Request.where(created_at: @history..@after).destroy_all
	end
end
