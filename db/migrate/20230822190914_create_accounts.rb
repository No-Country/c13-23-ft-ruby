class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.references :business, null: false, foreign_key: true
      t.string :name
      t.integer :balance_cents, default: 0

      t.timestamps
    end
  end
end
