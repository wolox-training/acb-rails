class AddLocaleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :locale, :string  , null: false, default: 'es'
  end
end
