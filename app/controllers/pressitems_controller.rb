class PressitemsController < ApplicationController
  before_action :set_pressitem, only: [:show, :edit, :update, :destroy]

  def index
    @pressitems = Kaminari.paginate_array(Pressitem.all.order('created_at DESC')).page(params[:page]).per(12)
  end

  def show
  end

  def new
    @pressitem = Pressitem.new
    authorize @pressitem
  end

  def edit
  end

  def create
    @pressitem = Pressitem.new(pressitem_params)
    authorize @pressitem
    if @pressitem.save
      redirect_to @pressitem, notice: 'Pressitem was successfully created.'
    else
      render :new
    end
  end

  def update
    if @pressitem.update(pressitem_params)
      redirect_to @pressitem, notice: 'Pressitem was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pressitem.destroy
    redirect_to pressitems_url, notice: 'Pressitem was successfully destroyed.'
  end

  private

    def set_pressitem
      @pressitem = Pressitem.friendly.find(params[:id])
      authorize @pressitem
    end

    def pressitem_params
      params.require(:pressitem).permit(:title, :image, :sitename, :link, :body)
    end
end
