class AddEmployeeBooleanToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :employee, :boolean
  end
end
