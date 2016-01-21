class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :company
      t.string :location
      t.integer :duration
      t.string :role
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
