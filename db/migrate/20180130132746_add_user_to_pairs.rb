class AddUserToPairs < ActiveRecord::Migration[5.1]
  def change
    add_reference :pairs, :user, foreign_key: true
  end
end
