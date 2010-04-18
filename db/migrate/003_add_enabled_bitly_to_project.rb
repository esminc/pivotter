migration 3, :add_enabled_bitly_to_project do
  up do
    modify_table :projects do
      add_column :enabled_bitly, Boolean
    end
  end

  down do
    modify_table :projects do
      drop_column :enabled_bitly
    end
  end
end
