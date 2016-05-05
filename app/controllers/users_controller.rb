class UsersController < ApplicationController
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    redirect_to controller: :static_pages, action: :home
  end

  def new
    @user = User.new
    @is_employee = params[:employee]
  end

  def create
    @user = User.new(user_params)
    @user.location = location
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to RedRock Capital!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :ssn, :telephone, :password, :password_confirmation, :address, :zipcode, :city, :state, :is_employee)
    end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || (@user.is_employee == false && current_user.is_employee) || (current_user.is_employee && current_user.admin?)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  end
