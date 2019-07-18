class UsersController < ApplicationController

  def index
    #@current_user = current_user
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
  end

  def show
      @user = User.find(params[:id])
      unless current_user.admin? 
        unless @user == current_user
          redirect_to users_path
      flash[:error] = "Access denied."
      end
    end
  end

  def destroy
    if current_user.admin?
      @user = User.find_by(params[:id])
      @user.destroy
    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end


end
