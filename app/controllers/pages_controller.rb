class PagesController < ApplicationController

  def home
    @user = User.new
  end

  def success

  end

  def build
    @user = User.find session[:user]
    @topics = Topic.all
    #raise "hell"
  end

  # def create
  #   @user = User.new user_params
  #
  #   if @user.save
  #     redirect_to success_path
  #   else
  #     render :new
  #   end
  # end
  #
  # private
  #
  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email)
  # end

end
