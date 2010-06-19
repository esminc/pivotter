# Helper methods defined here can be accessed in any controller or view in the application

Pivotter.helpers do
	def bitly(url)
		Bitly.use_api_version_3
		Bitly.new(ENV['BITLY_ID'], ENV['BITLY_KEY']).shorten(url).short_url
	end
end
