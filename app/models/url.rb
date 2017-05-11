class Url < ActiveRecord::Base
	validates :long_url, format: { with: %r{https?://.+}i, message: "Url must begin with https://"}, presence: true
	validates :short_url, presence: true
	
	def self.retrieve_short_url(long_url)
		url = find_by(long_url: long_url)
		url.short_url if url
	end

end
