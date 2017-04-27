class CreateDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :descriptions do |t|
      t.string :body
      t.belongs_to :page, foreign_key: true

      t.timestamps
    end
  end
end
