class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts_sorted = []
    Post.all.each do |x|
      if x.date.past? || x.date.today?
        @posts_sorted << x
      end
    end  
  end

  def show
    @post = Post.find(params[:id])
    @request = params[:id]
    @all_comments = Comment.where(post_id: params[:id])
  end

  def history
  end

  def new
    if current_user.email = "jelly@fish.com"
      @dates = []
      y = 0
      count = 0
      loop do 
        day = Date.new(2015, 11, 9) + y
        if day.future? || day.today
          @dates << day
          count += 1
        end
        y = y + 70
        break if count > 4
      end
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to '/', notice: "Album Successfully Posted!" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:quote, :band_pic, :album_art, :band_name, :album_name, :write_up, :youtube, :date)
  end
end
