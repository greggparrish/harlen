class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Productimage.all.order(:product_id).group_by{|p| [p.front, p.product.title, p.product.slug, p.color.title] }
    @prods = Product.joins(:productimages).group("products.id", "productimages.color_id").order(:title)
    @colors = Color.all
  end

  # GET /products/1
  def show
    @colors = Color.all
    @prod_colors = @product.productimages.group_by {|p| p.color}
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    if @product.save
      @product.productimages.build
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      @product.update_attributes(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:title, :price, :description, productimages_attributes: [:id, :color_id, :top, :front, :side1, :side2, :bottom, :with_model, :_destroy])  
    end
end
