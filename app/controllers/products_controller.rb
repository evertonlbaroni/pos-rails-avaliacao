class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_list
  # GET /products
  # GET /products.json
  def index
    @products = @list.products.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product
  end

  # GET /products/new
  def new
    @product = @list.products.new
  end

  # GET /products/1/edit
  def edit
    @product = @list.products.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = @list.products.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to list_product_path(@list,@product), notice: 'Produto cadastrado com Sucesso!' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to list_product_path(@list,@product), notice: 'Produto atualizado com sucesso!.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to list_products_path(@list), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_list
      @list = List.find(params[:list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :quantity, :description, :list_id)
    end
end
