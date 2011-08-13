# -*- coding: utf-8 -*-
Pivotter.controllers :projects do
	post '/:name/activities' do |name|
		@project = Project.first(:name => name)

		node = Nokogiri.parse(request.body.read, nil, 'UTF-8')

		author = node.css("activity > author").inner_text
		desc = node.css("activity > description").inner_text.gsub(/^#{author}/, '3\0').gsub(/(\".*?\")/, '7\0')

		links = node.css("activity stories story").map {|s|
			url = "http://www.pivotaltracker.com/story/show/#{s.at('id').inner_text}"
			if @project.enabled_bitly
				bitly(url)
			else
				url
			end
		}

		ShoutBot.shout(@project.irc_channel, @project.password, @project.ssl) do |channel|
			channel.notice "#{desc} - #{links.join(' ')}"
		end
	end
end
