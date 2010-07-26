class Project
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :irc_channel, String, :length => 100
  property :enabled_bitly, Boolean, :default => true
end
