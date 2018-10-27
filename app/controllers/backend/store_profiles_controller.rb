class Backend::StoreProfilesController < BackendController
  before_action :authenticate_user!
  before_action :site_identity

  def index
    @store_profiles = StoreProfile.all
  end

  def edit
    @store_profile = StoreProfile.find(params[:id])
  end

  def update
    @store_profile = StoreProfile.find(params[:id])

    if @store_profile.update(store_params)
      flash[:success] = 'Store profile successfully updated'
      redirect_to backend_store_profiles_path
    else
      flash[:danger] = "Oops... something wrong :( -- err: #{@store_profile.errors.full_messages}"
      redirect_to backend_store_profiles_path
    end
  end

  private

  def store_params 
    params.require(:store_profile).permit(:about, :contact)
  end

  def site_identity
    @site_name = SiteIdentity.first.site_name
  end
end
