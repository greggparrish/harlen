class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :set_tweets, only: [:show, :index]
  def index
    @tags = Tag.all.order('name asc')
    if params[:search]
      @stories = Kaminari.paginate_array(Story.search(params[:search])).page(params[:page]).per(11)
    else
      @stories = Kaminari.paginate_array(Story.all.order('created_at DESC')).page(params[:page]).per(11)
    end
    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end

  def new
    @story = Story.new
  end

  def show
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      @story.tag_ids = params[:story][:tag_ids]
      redirect_to @story, notice: 'Story Created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @story.update(story_params)
      @story.tag_ids = params[:story][:tag_ids]
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_url, notice: 'Story was deleted.'
  end

  private
    def set_story
      @story = Story.friendly.find(params[:id])
    end

    def set_tweets
      @tweets = twitter_client.user_timeline('UN_Women').take(3)
    end

    def story_params
      params.require(:story).permit(:title, :tagline, :image, :caption, :body, :tag_id) 
    end
end
