class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @user = current_user
      if current_user.is_employee
        redirect_to controller: 'employees', action: 'home'
      else
        redirect_to controller: 'clients', action: 'show', id: current_user.id
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
