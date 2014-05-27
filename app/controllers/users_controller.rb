class UsersController < ApplicationController
  before_action :signed_in_user,  only: [:index, :edit, :update, :destroy]
  before_action :correct_user,    only: [:edit, :update]
  before_action :admin_user,      only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    if signed_in?
      redirect_to root_url
      flash[:notify] = '!Please log out before signing up'
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "#{@user.name}, welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    # no longer necessary, as covered in correct_user below
    # @user = User.find(params[:id])
  end

  def update
    # no longer necessary, as covered in correct_user below
    #  @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    if current_user == user
      flash[:error] = "Cannot delete self."
    else
      user.destroy
      flash[:success] = "User deleted."
    end
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        # using a shortcut for flash[:notice]; doesn't work for error or success :-(
        redirect_to signin_url, notice: "Please sign in." unless signed_in?
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
