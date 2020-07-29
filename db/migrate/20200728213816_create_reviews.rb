class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.references :user
      t.references :recipe
      
      t.timestamps
    end
  end
end
