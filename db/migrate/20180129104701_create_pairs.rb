class CreatePairs < ActiveRecord::Migration[5.1]
  def change
    create_table :pairs do |t|
      t.references :student
      t.references :match

      t.timestamps
    end
  end
end
