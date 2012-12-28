class CreatePages < ActiveRecord::Migration
  def change
    create_table :wacky_pages do |t|
      t.string :slug
      t.text :body
      t.timestamps
    end
  end
end
