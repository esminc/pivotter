migration 6, :change_name_to_name_for_account do
  up do
    modify_table :accounts do
      rename_column :name, :name
    end
  end

  down do
    modify_table :accounts do
      change_column :name, :name
    end
  end
end
