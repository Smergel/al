class HomeController < ApplicationController
  def index
    if (!current_user.nil?) && (User.find(current_user.id).profile.nil?)
      redirect_to new_profile_path
    else
      @posts = Post.all
      Post.all.sort_by(&:date).reverse.each do |x|
        if x.date.past? || x.date.today?
          @post = x
          break if true
        end
      end
      gon.youtube = @post.youtube.split("=")[1]
      gon.artists = @post.band_name
      
      @count = 0

      Post.all.sort_by(&:date).reverse.each do |z|
        if (z.date.past? || z.date.today?) && (@count < 1)
          @last = z
          @count += 1
        end
      end 
      @all_comments = Comment.where(post_id: @last.id)

      @posts_sorted = []
      Post.all.sort_by(&:date).reverse.each do |y|
        if (y.date.past? || y.date.today?) && (@count <= 5)
          @posts_sorted << y
          @count += 1
        end
      end 
    end
  end

  def calendar
    @posts = Post.all
    @events = Event.all
    @date_today = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def leaderboard
    @leaderboard = Leaderboard.all
  end
end
