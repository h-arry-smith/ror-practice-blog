class CreateSuperUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :super_users do |t|
      t.string :password_digest
      t.boolean :default_password, default: true

      t.timestamps
    end
  end
end
