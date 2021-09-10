class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :user_name
      t.string :password
      t.string :role

      t.timestamps
    end
  end
end
