class Admin::AdminsController < ApplicationController
   before_action :admin_user

  def index
  end

  def edit
  end

  def update
  	
  end

  def destroy
  	
  end

  private
    def admin_user
      redirect_to new_user_session unless current_user.admin?
    end
end
