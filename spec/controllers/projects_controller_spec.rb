# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "ProjectsController" do
	describe "/projects/:name/activities" do
		def expect_shout(irc_channel, message)
			mock(bot = Object.new).whisper(message)
			stub(ShoutBot).shout(irc_channel) {|_, block| block.call(bot) }
		end

		before do
			@project = Project.create!(:name => 'rubyagile', :irc_channel => 'irc://example.com/#rubyagile')
		end

		context 'コメントが付けられたとき' do
			specify do
				expect_shout @project.irc_channel, 'Keita Urashima added comment: "テステス" - http://www.pivotaltracker.com/story/show/2809938'

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

		context '複数のストーリーが削除されたとき' do
			specify do
				expect_shout @project.irc_channel, 'Keita Urashima deleted 2 stories - http://www.pivotaltracker.com/story/show/3138008 http://www.pivotaltracker.com/story/show/3138007'

				post '/projects/rubyagile/activities', <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<activity>
  <id type="integer">16546072</id>
  <version type="integer">705</version>
  <event_type>multi_story_delete</event_type>
  <occurred_at type="datetime">2010/04/13 12:09:15 UTC</occurred_at>
  <author>Keita Urashima</author>
  <project_id type="integer">3574</project_id>
  <description>Keita Urashima deleted 2 stories</description>
  <stories>
    <story>
      <id type="integer">3138008</id>
      <url>https://www.pivotaltracker.com/services/v3/projects/3574/stories/3138008</url>
    </story>
    <story>
      <id type="integer">3138007</id>
      <url>https://www.pivotaltracker.com/services/v3/projects/3574/stories/3138007</url>
    </story>
  </stories>
</activity>
				XML
			end
		end
	end
end
