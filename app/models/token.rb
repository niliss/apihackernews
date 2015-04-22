class Token < ActiveRecord::Base
  belongs_to :user
  # before_create :set_auth_token

  def set_auth_token
		return if auth_token.present?
		self.auth_token = generated_auth_token
	end

	def generate_auth_token
		SecureRandom.uuid.gsub(/\-/,'')
	end
end