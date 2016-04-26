class EmployeesController < ApplicationController

  def home
    if current_user.admin
      redirect_to action: 'employees#manager_home'
    else
      redirect_to action: 'employees#employee_home'
    end
  end

  def manager_home

  end

  def employee_home

  end
end
