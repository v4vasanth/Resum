class CreateBasics < ActiveRecord::Migration
  def change
    create_table :basics do |t|
      t.string :full_name
      t.integer :phone
      t.string :linkedin
      t.string :twitter
      t.string :skype
      t.string :personal_website

      t.timestamps null: false
    end
  end
end
