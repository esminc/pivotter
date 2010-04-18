class Project
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :irc_channel, String
  property :enabled_bitly, Boolean
end
