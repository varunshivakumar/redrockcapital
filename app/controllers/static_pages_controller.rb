class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @user = current_user
      if current_user.is_a? Employee
        redirect_to action: 'employees#home'
      else
        redirect_to action: 'clients#home'
      end
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
