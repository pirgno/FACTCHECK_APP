class CreateNews < ActiveRecord::Migration[8.1]
  def change
    create_table :news do |t|
      t.string :name
      t.text :content
      t.boolean :trending, default: false

      t.timestamps
    end
  end
end
