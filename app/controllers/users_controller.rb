class UsersController < ApplicationController
  before_filter :signed_in_user,  only: [:edit, :update, :index, :destroy]
  before_filter :correct_user,    only: [:edit, :update]
  before_filter :admin_user,     only: :destroy


  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    redirect_to root_path if signed_in?
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @experiments = @user.experiments.paginate(page: params[:page])
  end

  def create
    if signed_in?
      redirect_to root_path
    else
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to HCMMW!"
        redirect_to @user
      else
        render 'new'
      end
    end
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    if User.find(params[:id]).admin?
      flash.now[:error] = "Not allowed to delete admin users."
      redirect_to users_url
    else
      User.find(params[:id]).destroy
      flash.now[:success] = "User destroyed."
      redirect_to users_url
    end
  end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
