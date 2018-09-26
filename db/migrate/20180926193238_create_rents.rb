class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|

      t.timestamps
    end
  end
end
