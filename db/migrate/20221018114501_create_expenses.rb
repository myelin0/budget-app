class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :amount 
      t.date :date_of_expense

      t.timestamps
    end
  end
end