require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "ProjectsController" do
	describe "/projects/:name/activities" do
		before do
			@name = "rubyagile"
			post "/projects/#{@name}/activities"
		end
	end
end
