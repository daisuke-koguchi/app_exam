class FeedsController < ApplicationController
  before_action :set_feed, only: %i[ show edit update destroy ]
  skip_before_action :login_required
  # GET /feeds or /feeds.json
  def index
    @feeds = Feed.all
  end

  def show
  end

  def new
    @feed = Feed.new
    #@feed.id = current_user.id
  end

  def edit
  end

  def create
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: "写真が登録されました" }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: "写真が変更されました." }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: "写真が削除されました." }
      format.json { head :no_content }
    end
  end

  private
    def set_feed
      @feed = Feed.find(params[:id])
    end

    def feed_params
      params.require(:feed).permit(:image, :image_cache)
    end
end
