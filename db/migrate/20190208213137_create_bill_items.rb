class CreateBillItems < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_items do |t|
      t.string :user
      t.float :paid_amount
      t.references :bill_list, foreign_key: true

      t.timestamps
    end
  end
end
