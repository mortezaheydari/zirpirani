class CreateMeems < ActiveRecord::Migration
  def change
    create_table :meems do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
