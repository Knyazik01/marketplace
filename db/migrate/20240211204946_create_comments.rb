class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, null: true, foreign_key: true
      t.string :text
      t.references :ad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
