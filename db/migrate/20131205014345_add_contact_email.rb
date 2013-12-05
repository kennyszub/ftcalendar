class AddContactEmail < ActiveRecord::Migration
  def change
    add_column :events, :contact, :string
  end
end
