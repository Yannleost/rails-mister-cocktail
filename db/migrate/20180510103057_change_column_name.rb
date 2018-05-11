class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :doses, :amount, :description
    change_column :doses, :description, :string
   end
end

