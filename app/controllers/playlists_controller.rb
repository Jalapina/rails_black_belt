class PlaylistsController < ApplicationController

    def create
        Playlist.create(user:User.find(session[:id]),song:Song.find(params[:id]))
        redirect_to '/'
    end

end
