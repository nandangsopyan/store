class Frontend::HomeController < FrontendController

  before_action :site_identity

  def index
    if params[:search]
      @products = Product.where('title like ?', "%#{params[:search]}%")
    else
      @products = Product.order(id: :desc)
    end
    @products = @products.paginate( per_page: 6, page: params[:page] )
    @categories = Category.all
    @sliders = Slider.order(id: :desc)
  end

  def show
    @product = Product.friendly.find(params[:id])
    @categories = Category.all
  end

  def profile
    @categories = Category.all
    @store_profile = StoreProfile.all
  end

  private

  def site_identity
    @site_name = SiteIdentity.first.site_name
    @site_description = SiteIdentity.first.site_description
    @site_meta = SiteIdentity.first.site_meta
    @image = SiteIdentity.first.image_url.to_s
  end



end
