class AddOrganizationName < ActiveRecord::Migration
  def change
    add_column :events, :organization, :string
  end
end
