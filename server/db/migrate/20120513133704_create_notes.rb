class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.integer :paper_id
      t.integer :pagenum
      t.string :posfrom
      t.string :posto
      t.text :content

      t.timestamps
    end
  end
end
