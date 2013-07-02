class CreateCategoriesSuppliers < ActiveRecord::Migration
  def self.up
    # Create the association table
    create_table :categories_suppliers, :id => false do |t|
      t.integer :category_id, :null => false
      t.integer :supplier_id, :null => false
    end

    # Add table index
    add_index :categories_suppliers, [:category_id, :supplier_id], :unique => true

  end

  def self.down
    remove_index :categories_suppliers, :column => [:category_id, :supplier_id]
    drop_table :categories_suppliers
  end
end
