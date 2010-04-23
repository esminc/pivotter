migration 4, :remove_name_to_account do
  up do
    modify_table :accounts do
      drop_column :name
      drop_column :surname
    end
  end

  down do
    modify_table :accounts do
      add_column :name, String
      add_column :surname, String
    end
  end
end







