class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.references :business, null: false, foreign_key: true
      t.string :name
      t.money :balance, with_currency: :ars


      t.timestamps
    end
  end
end
