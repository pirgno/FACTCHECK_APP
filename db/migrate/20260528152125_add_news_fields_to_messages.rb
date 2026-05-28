class AddNewsFieldsToMessages < ActiveRecord::Migration[8.1]
  def change
    add_column :messages, :name, :string
    add_column :messages, :category, :string
    add_column :messages, :tags, :string, array: true, default: []
    add_column :messages, :origin, :text
  end
end
