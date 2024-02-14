class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.date :date
      t.text :title
      t.text :description
      t.float :amount
      t.string :category

      t.timestamps
    end
  end
end
