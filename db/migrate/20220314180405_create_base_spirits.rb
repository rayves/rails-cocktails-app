class CreateBaseSpirits < ActiveRecord::Migration[7.0]
  def change
    create_table :base_spirits do |t|
      t.string :name

      t.timestamps
    end
  end
end
