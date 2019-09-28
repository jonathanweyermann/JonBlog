class Admin::UsersController < Admin::ApplicationController
  expose(:user)
  expose(:users) { User.paged_search(params[:page], params[:search]) }

  def create
    if user.save
      flash[:notice] = 'User Created'
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def update
    if user.update(user_params)
      flash[:notice] = 'User Updated'
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def destroy
    if user.destroy
      flash[:notice] = 'User Removed'
      redirect_to admin_users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :jobmode)
  end
end
