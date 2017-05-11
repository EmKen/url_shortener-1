class UrlsController < ApplicationController
	def create
		short_url = shorten
		@url = Url.new(long_url: params[:url][:long_url], short_url: short_url)
		if @url.save
			redirect_to urls_path
			# @short = @url.short_url
			# render 'new'
		else
			@errors = @url.errors.full_messages
			render 'new'
		end
	end

	def index
		@urls = Url.all
	end

	def new
		@url = Url.new
	end

	def show
		@url = Url.find(params[:id])
	end

	def shorter
		(('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a).sample(rand(2)+6).join
	end

	def shorten
		short = shorter
		while Url.exists?(short_url: short)
			short = shorter
		end
		short
	end
end
