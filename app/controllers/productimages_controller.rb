class ProductimagesController < InheritedResources::Base

  private

    def productimage_params
      params.require(:productimage).permit(:orientation, :color, :image, :price)
    end
end

