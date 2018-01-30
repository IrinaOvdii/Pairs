class AddDayToPairs < ActiveRecord::Migration[5.1]
  def change
    add_column :pairs, :day, :datetime
  end
end
