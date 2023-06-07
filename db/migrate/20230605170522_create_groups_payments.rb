class CreateGroupsPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_payments do |t|
      t.references :payment, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end

    add_index :groups_payments, [:payment_id, :group_id], unique: true
    add_index :groups_payments, [:group_id, :payment_id], unique: true
  end
end
