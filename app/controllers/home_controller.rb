class HomeController < ApplicationController
  def index
    @posts = Post.all
    Post.all.sort_by(&:date).reverse.each do |x|
      if x.date.past? || x.date.today?
        @post = x
        break if true
      end
    end
    @all_comments = Comment.where(post_id: Post.last.id)
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
