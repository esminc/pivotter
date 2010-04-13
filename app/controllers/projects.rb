Pivotter.controllers :projects do
	post '/:name/activities' do |name|
		@project = Project.first(:name => name)

		node = Nokogiri.parse(request.body.read)
		desc = node.css("activity description").inner_text
		id = node.css("activity stories story > id").inner_text

		ShoutBot.shout(@project.irc_channel) do |channel|
			channel.say "#{desc} - http://www.pivotaltracker.com/story/show/#{id}"
		end
	end
end
