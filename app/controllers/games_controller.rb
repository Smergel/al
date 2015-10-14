class GamesController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    list = Post.all
    @songs = []
    @artists = []
    list.shuffle.each do |x|
      @songs << x.youtube.split('=')[1]
      @artists << x.band_name
    end
    gon.youtube = @songs
    gon.artists = @artists
  end

  def score
    @leaderboard = Leaderboard.new
    @leaderboard.score = params[:score]
    @leaderboard.user_id = current_user.id
    @leaderboard.time = 1
    @leaderboard.save
    redirect_to '/games'
  end

  private
  def game_params
    params.require(:game).permit(:youtube, :band_name)
  end
end
