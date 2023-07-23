class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.float :total_cost
      t.integer :number_of_people

      t.timestamps
    end
  end
end
