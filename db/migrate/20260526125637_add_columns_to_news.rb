class AddColumnsToNews < ActiveRecord::Migration[8.1]
  def change
    add_column :news, :verdict, :string
    add_column :news, :truth_percentage, :integer
    add_column :news, :category, :string
    add_column :news, :tags, :string, array: true, default: []
    add_column :news, :confidence_level, :string
    add_column :news, :origin, :string
  end
end
