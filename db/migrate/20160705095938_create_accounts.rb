class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :account_type
      t.boolean :active

      t.timestamps
    end
  end
end
