class AddLeftoverToPair < ActiveRecord::Migration[5.1]
  def change
    add_column :pairs, :leftover, :string
  end
end
