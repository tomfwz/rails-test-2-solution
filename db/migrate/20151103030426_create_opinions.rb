class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string :content
      t.boolean :agree      
      t.references :topic, index: true

      t.timestamps
    end
  end
end
