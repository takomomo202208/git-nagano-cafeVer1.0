class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|

      t.timestamps
    end
  end
end
