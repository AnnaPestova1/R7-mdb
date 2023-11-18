class AddProductionToActor < ActiveRecord::Migration[7.0]
  def change
    add_column :actors, :production_id, :integer
    add_column :actors, :production_type, :string
  end
end
