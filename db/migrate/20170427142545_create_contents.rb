class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.text :body
      t.string :block_type
      t.belongs_to :page, foreign_key: true

      t.timestamps
    end
  end
end
