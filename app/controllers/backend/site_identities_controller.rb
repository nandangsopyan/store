class Backend::SiteIdentitiesController < BackendController
  before_action :authenticate_user!
  before_action :site_identity

  def index
    @site_identities = SiteIdentity.all
  end

  def edit
    @site_identity = SiteIdentity.find(params[:id])
  end

  def update
    @site_identity = SiteIdentity.find(params[:id])

    if @site_identity.update(site_params)
      flash[:success] = 'Site identity successfully updated'
      redirect_to backend_site_identities_path
    else
      flash[:danger] = "Oops... something wrong :( -- err: #{@site_identity.errors.full_messages}"
      ridirect_to backend_site_identities_path
    end
  end


  private

  def site_params
    params.require(:site_identity).permit(:site_name, :site_description, :site_meta, :image)
  end

  def site_identity
    @site_name = SiteIdentity.first.site_name
    @site_logo = SiteIdentity.first.image_url
  end

end
