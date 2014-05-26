class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email].downcase)
    # post implementation of form_tag in sessions\new.html.erb
    # removed [:session] from params[:session][:email]
    if user && user.authenticate(params[:password])
    # removed [:session] from params[:session][:password]
      sign_in user
      redirect_back_or user
    else
      # flash.now - contents disappear as soon as there is an additional request - cool!
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
