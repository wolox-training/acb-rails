class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
       t.string   :gender       , null: false, default: ""
       t.string   :author       , null: false, default: ""
       t.string   :image
       t.string   :title        , null: false, default: ""
       t.string   :publisher    , null: false, default: ""
       t.string   :release_date , null: false, default: ""
       t.timestamps
    end
  end
end
