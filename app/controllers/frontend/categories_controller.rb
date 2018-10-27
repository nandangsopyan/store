class Frontend::CategoriesController < FrontendController
  before_action :site_identity

  def show 
    @category = Category.friendly.find(params[:id])
    @category_content = @category.products.order(id: :desc).paginate( per_page: 9, page: params[:page] )
    @categories = Category.all
  end

  def site_identity
    @site_name = SiteIdentity.first.site_name
    @site_description = SiteIdentity.first.site_description
    @site_meta = SiteIdentity.first.site_meta
  end
end
