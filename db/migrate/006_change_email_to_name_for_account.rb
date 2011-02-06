migration 6, :change_email_to_name_for_account do
  up do
    modify_table :accounts do
      rename_column :email, :name
    end
  end

  down do
    modify_table :accounts do
      rename_column :name, :email
    end
  end
end
