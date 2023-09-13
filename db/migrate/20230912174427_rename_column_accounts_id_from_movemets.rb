class RenameColumnAccountsIdFromMovemets < ActiveRecord::Migration[7.0]
  def change
    rename_column :movements, :accounts_id, :account_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
