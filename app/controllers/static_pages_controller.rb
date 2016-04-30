class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @user = current_user
      if current_user.is_employee
        if current_user.admin
          redirect_to controller: 'employees', action: 'manager_home', id: current_user.id
        else
          redirect_to controller: 'employees', action: 'employee_home', id: current_user.id
        end
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
