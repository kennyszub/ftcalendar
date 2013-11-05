class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :starts_at
      t.datetime :ends_at
      t.text :description
      t.text :signup_url
      t.integer :max_volunteers

      t.timestamps
    end
  end
end
