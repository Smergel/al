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

    gon.youtube = @post.youtube.split("=")[1]
    gon.artists = @post.band_name
  end

  def history
  end

  def new
    if !current_user.nil? 
      if current_user.email == "jacob.smergel@gmail.com"
        @dates = []
        y = 0
        count = 0
        loop do 
          day = Date.new(2015, 11, 9) + y
          if day.future? || day.today?
            @dates << day
            count += 1
          end
          y = y + 70
          break if count > 4
        end
      end
      if current_user.email == "wmconlow@gmail.com"
        @dates = []
        y = 0
        count = 0
        loop do 
          day = Date.new(2016, 2, 1) + y
          if day.future? || day.today?
            @dates << day
            count += 1
          end
          y = y + 70
          break if count > 4
        end
      end
      if current_user.email == "jaredwillmann@gmail.com"
        @dates = []
        y = 0
        count = 0
        loop do 
          day = Date.new(2016, 2, 15) + y
          if day.future? || day.today?
            @dates << day
            count += 1
          end
          y = y + 70
          break if count > 4
        end
      end
      if current_user.email == "andrewe.katz88@gmail.com"
        @dates = []
        y = 0
        count = 0
        loop do 
          day = Date.new(2016, 2, 29) + y
          if day.future? || day.today?
            @dates << day
            count += 1
          end
          y = y + 70
          break if count > 4
        end
      end
      if current_user.email == "spercolani@gmail.com"
        @dates = []
        y = 0
        count = 0
        loop do 
          day = Date.new(2014, 1, 4) + y
          if day.future? || day.today?
            @dates << day
            count += 1
          end
          y = y + 70
          break if count > 4
        end
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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      @post.save
      redirect_to profile_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to :back
  end

  private
  def post_params
    params.require(:post).permit(:tracks, :genre, :release_year, :fav_song,
    :quote, :band_pic, :album_art, :band_name, :album_name, :write_up, :youtube, :date)
  end
end
