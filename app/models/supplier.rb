class Supplier < ActiveRecord::Base
  has_many :categorizations, :dependent => :destroy
  has_many :categories, :through => :categorizations, :dependent => :destroy

  validates :name, :presence => true, :length => { :within => 5..100 }
  validates :address, :length => { :within => 5..100 }, :allow_blank => true
  validates :postalcode, :length => { :is => 5 }, :allow_blank => true
  validates :city, :presence => true, :length => { :within => 5..100 }
  validates :phone, :length => { :within => 8..20 }, :allow_blank => true
  
  attr_writer :categories_ids
  after_save :assign_categories
  
  def categories_ids
    if @categories_ids
      @categories_ids
    elsif id
      Supplier.find(id).categories.map{|cat| cat.id}
    else 
      "[]"
    end
  end
  
  private
  
  def assign_categories
    if @categories_ids
      self.categories = Category.find(ActiveSupport::JSON.decode(@categories_ids))
    end
  end
end
