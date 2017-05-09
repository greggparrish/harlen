class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Productimage.all.order(:product_id).group_by{|p| [p.front, p.product.title, p.product.slug, p.color.title] }
    @prods = Product.joins(:productimages).group("products.id", "productimages.color_id").order(:title)
    @colors = Color.all
    @order_item = current_order.order_items.new
  end

  def show
    @colors = Color.all
    @prod_colors = @product.productimages.group_by {|p| p.color}
  end

  def new
    @product = Product.new
    authorize @product
  end

  def edit
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    if @product.save
      @product.productimages.build
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      @product.update_attributes(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    def set_product
      @product = Product.friendly.find(params[:id])
      authorize @product
    end

    def product_params
      params.require(:product).permit(:title, :price, :description, productimages_attributes: [:id, :color_id, :top, :front, :side1, :side2, :bottom, :with_model, :_destroy])  
    end
end
