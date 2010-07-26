migration 5, :change_irc_channel_length do
  up do
    modify_table :projects do
      change_column :irc_channel, "varchar(100)"
    end
  end

  down do
    modify_table :projects do
      change_column :irc_channel, "varchar(50)"
    end
  end
end
