require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "ProjectsController" do
	describe "/projects/:name/activities" do
		before do
			@project = Project.create!(:name => 'rubyagile', :irc_channel => 'irc://example.com/#rubyagile')
		end

		context 'コメントが付けられたとき' do
			specify do
				mock(bot = Object.new).say('Keita Urashima added comment: "テステス" - http://www.pivotaltracker.com/story/show/1455909')
				stub(ShoutBot).shout(@project.irc_channel) {|_, block| block.call(bot) }

				post '/projects/rubyagile/activities', <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<activity>
  <id type="integer">16537497</id>
  <version type="integer">692</version>
  <event_type>note_create</event_type>
  <occurred_at type="datetime">2010/04/13 09:17:55 UTC</occurred_at>
  <author>Keita Urashima</author>
  <project_id type="integer">3574</project_id>
  <description>Keita Urashima added comment: &quot;&#12486;&#12473;&#12486;&#12473;&quot;</description>
  <stories>
    <story>
      <id type="integer">2809938</id>
      <url>https://www.pivotaltracker.com/services/v3/projects/3574/stories/2809938</url>
      <notes>
        <note>
          <id type="integer">1455909</id>
          <text>&#12486;&#12473;&#12486;&#12473;</text>
        </note>
      </notes>
    </story>
  </stories>
</activity>
				XML
			end
		end
	end
end
