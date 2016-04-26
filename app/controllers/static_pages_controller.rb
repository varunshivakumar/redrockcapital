class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @user = current_user
      if current_user.is_a? Employee
        redirect_to controller: 'employees', action: 'home'
      else
        redirect_to controller: 'clients', action: 'home'
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
