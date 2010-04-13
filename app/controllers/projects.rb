Pivotter.controllers :projects do
	post "/:name/activities" do |name|
		@project = Project.first(:name => name)
	end
end
