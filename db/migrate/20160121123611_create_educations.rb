class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :degree
      t.string :college
      t.string :location
      t.integer :year_of_grad
      t.float :gpa
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
