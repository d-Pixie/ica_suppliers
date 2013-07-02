class HomeController < ApplicationController
  def index
    @suppliers = Supplier.find( :all, :conditions => 'latlong IS NOT NULL' )
    @catagories = Category.find( :all, :joins => :categorizations, :conditions => 'supplier_id IS NOT NULL', :order => :name ).uniq!
  end
  
  def about
  end
end
