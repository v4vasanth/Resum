class ChangePhoneFormatInBasic < ActiveRecord::Migration
  def change
  	change_column :basics, :phone, :string
  end
end
