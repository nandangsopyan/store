class Backend::DashboardController < BackendController
  before_action :authenticate_user!
  before_action :site_identity

  def index
  end

  def create
  end

  private

  def site_identity
    @site_name = SiteIdentity.first.site_name
  end



end
