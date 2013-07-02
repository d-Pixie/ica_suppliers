#encoding:UTF-8
class SuppliersController < ApplicationController
 
  helper_method :sort_column, :sort_direction
  
  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.order(sort_column + " " + sort_direction)
    @catagories = Category.all.sort_by(&:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @suppliers }
    end
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
    @supplier = Supplier.find(params[:id])
    @catagories = Category.all.sort_by(&:name)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @supplier }
    end
  end

  # TODO Remove fixture 'None' from supplier database
  # GET /suppliers/new
  # GET /suppliers/new.json
  def new
    @supplier = Supplier.new
    @catagories = Category.all.sort_by(&:name)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @supplier }
    end
  end

  # GET /suppliers/1/edit
  def edit
    @supplier = Supplier.find(params[:id])
    @catagories = Category.all.sort_by(&:name)
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(params[:supplier])
    @catagories = Category.all.sort_by(&:name)


    respond_to do |format|
      if @supplier.save
        format.html { redirect_to @supplier, notice: 'Leverantören har lagts till.' }
        format.json { render json: @supplier, status: :created, location: @supplier }
      else
        format.html { render action: "new" }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /suppliers/1
  # PUT /suppliers/1.json
  def update
    @supplier = Supplier.find(params[:id])
    @catagories = Category.all.sort_by(&:name)

    respond_to do |format|
      if @supplier.update_attributes(params[:supplier])
        format.html { redirect_to @supplier, notice: 'Leverantören har uppdaterats.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy

    respond_to do |format|
      format.html { redirect_to suppliers_url }
      format.json { head :ok }
    end
  end
  
  private
  
  def sort_column
    Supplier.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
