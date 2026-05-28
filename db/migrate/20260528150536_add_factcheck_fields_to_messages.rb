class AddFactcheckFieldsToMessages < ActiveRecord::Migration[8.1]
  def change
    add_column :messages, :verdict, :string
    add_column :messages, :truth_percentage, :integer
    add_column :messages, :confidence_level, :string
  end
end
