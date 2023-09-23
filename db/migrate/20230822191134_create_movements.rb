class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.references :accounts, null: false, foreign_key: true
      t.decimal :balance_cents, default: 0
      t.string :currency
      t.enum :category, enum_name: :type_of_category, enum_type: :integer
      t.string :beneficiary
      t.text :note

      t.timestamps
    end
  end
end
