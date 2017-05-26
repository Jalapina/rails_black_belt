class SongsController < ApplicationController
  def index
    if session[:id].nil?
      redirect_to '/sessions/new'
    else
      @user = User.find(session[:id])
      @songs = Song.all
      puts @songs
    end
  end

  def create
    @song = Song.new(title:params[:title],artist:params[:artist])

    if @song.valid?
      @song.save
      redirect_to '/'
    else
      flash[:errors] = ['Invalid song']
      redirect_to '/'
    end
  end
  

  def show
    @song = Song.find(params[:id])
    @users = Playlist.all
  end
  
end
