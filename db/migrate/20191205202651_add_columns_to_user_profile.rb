class AddColumnsToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :username, :string
    add_column :user_profiles, :age, :integer
    add_column :user_profiles, :ethnicity, :string
    add_column :user_profiles, :sexorientation, :string
    add_column :user_profiles, :nationality, :string
    add_column :user_profiles, :gender, :string
    add_column :user_profiles, :employed, :boolean
    add_column :user_profiles, :bio, :string
  end
end
