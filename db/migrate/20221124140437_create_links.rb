class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :code
      t.string :long_url
      t.string :alias
      t.integer :click, default: 0
      t.timestamps
    end
  end
end