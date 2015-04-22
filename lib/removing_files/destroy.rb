class ApiRequest

	def self.destroy
		@history = (Time.now - 1.year)
		@after = (Time.now - 1.minute)
		@select = Request.where(created_at: @after..Time.now)
		Request.where(created_at: @history..@after).destroy_all
	end

end