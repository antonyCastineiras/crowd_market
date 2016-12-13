class CreateAdverts < ActiveRecord::Migration[5.0]
  def change
    create_table :adverts do |t|
      t.string :width
      t.string :height
      t.string :left
      t.string :top

      t.timestamps
    end
  end
end
