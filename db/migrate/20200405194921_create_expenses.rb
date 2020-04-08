class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :kind
      t.string :concept
      t.string :category
      t.integer :amount

      t.timestamps
    end
  end
end
