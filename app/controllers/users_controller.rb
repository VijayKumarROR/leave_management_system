class UsersController < BaseController
  before_action :manager_required, only: :create

  def create
    if @user.save
      p "+++++++++++++++++++++++++++++++++++++++"
      redirect_to users_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password, :password_confirmation,:name,:role
    )
  end
end
