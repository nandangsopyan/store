class Backend::UsersController < BackendController
  before_action :authenticate_user!

  before_action :site_identity

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to backend_users_path, success: 'User updated!'
    else
      render 'edit', danger: "Oops... something wrong -- err #{@user.errors.messages}" 
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def site_identity
    @site_name = SiteIdentity.first.site_name
  end
end
