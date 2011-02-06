# -*- coding: utf-8 -*-
Pivotter.helpers do
	def bitly(url)
		Bitly.use_api_version_3
		Bitly.new(ENV['BITLY_ID'], ENV['BITLY_KEY']).shorten(url).short_url
	end
end
