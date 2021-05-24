class SessionController < ApplicationController
  def new
  end

  def login
    user = User.find_by :email => params[:email]

 

    if user.present? && user.authenticate(params[:password])
      if user.admin == true
        session[:user_id] = user.id
        redirect_to users_path 
      else
        session[:user_id] = user.id
        redirect_to root_path # match  
      end
    else
      flash[:error_message] = "Invalid email or password"
      redirect_to login_path # no match, try again
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
