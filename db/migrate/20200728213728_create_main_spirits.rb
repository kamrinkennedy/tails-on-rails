class CreateMainSpirits < ActiveRecord::Migration[6.0]
  def change
    create_table :main_spirits do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
