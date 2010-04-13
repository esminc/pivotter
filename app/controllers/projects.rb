Pivotter.controllers :projects do
	post '/:name/activities' do |name|
		@project = Project.first(:name => name)

		ShoutBot.shout(@project.irc_channel) do |channel|
			channel.say 'Hello!'
		end
	end
end
