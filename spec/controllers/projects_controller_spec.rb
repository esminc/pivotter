# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "ProjectsController" do
  describe "/projects/:name/activities" do
    def expect_shout(irc_channel, message, password, ssl)
      mock(bot = Object.new).notice(message)
      stub(ShoutBot).shout(irc_channel, password, ssl) {|_, _, _, block| block.call(bot) }
    end

    context 'bitlyが有効なとき' do
      before do
        @project = Project.create!(:name => 'rubyagile', :irc_channel => 'irc://example.com/#rubyagile', :enabled_bitly => true, :password => nil, :ssl => false)
      end

      context 'コメントが付けられたとき' do
        before do
          stub(Bitly).new.with_any_args.stub!.shorten.with_any_args.stub!.short_url { 'http://bit.ly/c6rPQs' }
        end

        specify do
          expect_shout @project.irc_channel, '3Keita Urashima added comment: 7"テステス" - http://bit.ly/c6rPQs', nil, false

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
        before do
          stub(Bitly).new.with_any_args.stub!.shorten.with_any_args.stub!.short_url { 'http://bit.ly/c6rPQs' }
        end

        specify do
          expect_shout @project.irc_channel, '3Keita Urashima deleted 2 stories - http://bit.ly/c6rPQs http://bit.ly/c6rPQs', nil, false

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

      context 'ストーリーの description を変更したとき' do
        before do
          stub(Bitly).new.with_any_args.stub!.shorten.with_any_args.stub!.short_url { 'http://bit.ly/c6rPQs' }
        end

        specify do
          expect_shout @project.irc_channel, '3Keita Urashima edited 7"pivotterをアナウンスする" - http://bit.ly/c6rPQs', nil, false

          post '/projects/rubyagile/activities', <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<activity>
  <id type="integer">16618577</id>
  <version type="integer">745</version>
  <event_type>story_update</event_type>
  <occurred_at type="datetime">2010/04/14 01:56:56 UTC</occurred_at>
  <author>Keita Urashima</author>
  <project_id type="integer">3574</project_id>
  <description>Keita Urashima edited &quot;pivotter&#12434;&#12450;&#12490;&#12454;&#12531;&#12473;&#12377;&#12427;&quot;</description>
  <stories>
    <story>
      <id type="integer">3149854</id>
      <url>https://www.pivotaltracker.com/services/v3/projects/3574/stories/3149854</url>
      <description>shout&#12399;&#22768;&#12364;&#12391;&#12363;&#12356;&#12398;&#12391;&#12375;&#12378;&#12363;&#12395;&#35328;&#12358;&#12424;&#12358;&#12395;&#12394;&#12387;&#12383;&#12425;
README&#12434;&#26360;&#12367; (&#33521;&#35486;&#12391;)</description>
    </story>
  </stories>
</activity>
          XML
        end
      end
    end

    context 'bitlyが無効なとき' do
      before do
        @project = Project.create!(:name => 'pivotter', :irc_channel => 'irc://example.com/#pivotter', :enabled_bitly => false, :password => nil, :ssl => true)
      end

      specify do
        expect_shout @project.irc_channel, '3Keita Urashima added comment: 7"テステス" - http://www.pivotaltracker.com/story/show/2809938', nil, true

        post '/projects/pivotter/activities', <<-XML
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
