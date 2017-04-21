class ProductviewsController < InheritedResources::Base

  private

    def productview_params
      params.require(:productview).permit(:product_id, :productimage_id)
    end
end

