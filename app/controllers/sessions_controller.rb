class SessionsController < ApplicationController
  def new
    if session[:id]
      redirect_to '/'
    end
  end

  def create
    
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect_to '/'
    else
      flash[:errors] = ['Invalid Login']
      redirect_to '/sessions/new'
    end
  end

    def logout
    session.clear
    redirect_to '/sessions/new'
    end
end
