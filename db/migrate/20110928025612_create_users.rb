class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.integer :num_logins, :default => 1

      t.timestamps
    end
  end
end
