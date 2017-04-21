class ColorsController < InheritedResources::Base

  private

    def color_params
      params.require(:color).permit(:title, :material, :hex1, :hex2)
    end
end

