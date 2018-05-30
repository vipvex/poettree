class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :admin_login]

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_back(fallback_location: root_path)  }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def admin_login
    
    #redirect_back and return if params[:password] != 'ilovepoettree'
    
    @user.update(admin: true)
    
    redirect_to '/editor'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :admin)
    end
end
