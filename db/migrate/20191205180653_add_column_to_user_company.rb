class AddColumnToUserCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :user_companies, :year, :integer
  end
end
