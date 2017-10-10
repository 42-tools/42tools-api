class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :login
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.text :image_url
      t.boolean :staff
      t.integer :correction_point
      t.string :pool_month
      t.string :pool_year
      t.integer :wallet

      t.timestamps
    end
  end
end
