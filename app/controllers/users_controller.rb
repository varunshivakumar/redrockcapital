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
    if @user.save
      # sign_in @user
      flash[:success] = "Account Created. User can log in"
      if @user.is_employee
        redirect_to controller: 'employees', action: 'employee_home', id: @user.id
      else
        redirect_to controller: 'clients', action: 'show', id: @user.id
      end
    else
      redirect_to controller: 'users', action: 'new', id: @user.id
    end
  end

  def edit
    @is_employee = params[:employee]
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      if @user.is_employee
        redirect_to controller: 'employees', action: 'employee_home', id: @user.id
      else
        redirect_to controller: 'clients', action: 'show', id: @user.id
      end
    else
      redirect_to controller: 'users', action: 'edit', id: @user.id
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :ssn, :telephone, :password, :password_confirmation, :address, :zipcode, :city, :state, :is_employee, :hourly_rate, :credit_card_no, :rating)
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
