class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.integer :postalcode
      t.string :city
      t.string :phone
      t.string :fax
      t.string :mail
      t.string :homepage
      t.string :latlong

      t.timestamps
    end
  end
end
