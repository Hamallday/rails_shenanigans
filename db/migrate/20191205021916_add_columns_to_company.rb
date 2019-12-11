class AddColumnsToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :name, :string
    add_column :companies, :headquarters, :string
    add_column :companies, :industry, :string
    add_column :companies, :number_of_employees, :string
    add_column :companies, :revenue, :string
    add_column :companies, :mission_motto_ideal, :string
    add_column :companies, :publicly_owned, :boolean
    add_column :companies, :website, :string
  end
end
