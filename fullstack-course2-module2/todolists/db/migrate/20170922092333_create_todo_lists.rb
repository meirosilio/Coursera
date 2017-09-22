class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :list_name
      t.date :lise_due_date

      t.timestamps null: false
    end
  end
end
