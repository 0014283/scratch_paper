class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
    	t.string :title
        t.index :title
        t.text :content, null: false
        t.index :content
    	t.integer :user_id, null: false
    	t.integer :genre_id
    	t.date :start_date
    	t.index :start_date
    	t.date :end_date
    	t.index :end_date
    	t.datetime :created_at, null: false, default: "now"
    	t.datetime :updated_at, null: false, default: "now"
      t.timestamps
    end
  end
end
