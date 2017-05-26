class UsersController < ApplicationController
  def new
    if session[:id]
      redirect_to '/'
    end
  end

  def create
    @user = User.new user_params
    if @user.valid?
      @user.save
      session[:id] = @user.id
      redirect_to '/'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users/new'
    end

  end
  
  def show
    @user = User.find(params[:id])
    @playlist = Playlist.where(:user_id => params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
    end

end
