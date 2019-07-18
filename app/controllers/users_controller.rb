class UsersController < ApplicationController

  def index
    #@current_user = current_user
  end

  def new
    @user = User.new
  end

  def create
  end

  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      flash[:error] = "Access denied."
      redirect_to users_path
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
