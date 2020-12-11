class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :opinion_id
      t.integer :user_id
      t.boolean :agreeable

      t.timestamps
    end
  end
end
