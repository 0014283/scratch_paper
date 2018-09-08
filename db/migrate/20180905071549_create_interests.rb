class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
    	t.integer :paper_id, null: false
    	t.integer :user_id, null: false
    	t.datetime :created_at, null: false, default: "now"
    	t.datetime :updated_at, null: false, default: "now"
      t.timestamps
    end
  end
end
