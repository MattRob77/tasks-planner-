class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string #salt and hash your password not plain text- Hides password 
  end
end
