class SessionsController < ApplicationController
  def new
 end

  def create
  	session[:name] = params[:name]
  	if !session[:name].blank?
	  	redirect_to '/'
	  else
	  	redirect_to sessions_new_path
	  end
  end

  def destroy
  	session.delete :name
  	redirect_to '/'
  end
end
