class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password_digest
      t.string :phone
      t.string :full_name

      t.timestamps
    end
  end
end
