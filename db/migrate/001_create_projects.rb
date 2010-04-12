migration 1, :create_projects do
  up do
    create_table :projects do
      column :id, Integer, :serial => true
      column :name, String
      column :irc_channel, String
    end
  end

  down do
    drop_table :projects
  end
end
