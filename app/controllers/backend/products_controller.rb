class Backend::ProductsController < BackendController
  before_action :authenticate_user!
  before_action :site_identity

  def index
    @products = Product.order(id: :desc)
  end

  def show
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @product = Product.new(product_params)

    if params[:publish]
      @product.published = 1
    else
      @product.published = 0
    end

    if @product.save
      params[:images]['image'].each do |i|
        @image = @product.images.create!(:image => i)
      end
      if @product.published?
        flash[:success] = 'Product sucessfully published'
        render 'new'
      else
        flash[:primary] = 'Product saved as draft'
        render 'new'
      end
    else
      render 'new'
    end
  end

  def edit
    @product = Product.friendly.find(params[:id])
    @categories = Category.all
  end

  def update
    @categories = Category.all
    @product = Product.friendly.find(params[:id])

    if params[:publish]
      @product.published = 1
    else
      @product.published = 0
    end

    if @product.update(product_params)
      params[:images]['image'].each do |i|
        @image = @product.images.create!(:image => i)
      end
      if @product.published?
        flash[:success] = 'Product sucessfully published'
        render 'new'
      else
        flash[:primary] = 'Product saved as draft'
        render 'new'
      end
    else
      render 'new'
    end

  end

  def destroy
    @product = Product.friendly.find(params[:id])

    if @product.destroy
      flash[:success] = 'Product sucessfully deleted'
      redirect_to request.referer
    end
  end

  private
  
  def product_params
    params.require(:product).permit( :title, :price, :description, :specification, :product_keyword, :image, :published, :category_ids => [], images_attributes: [:id, :product_id, :image] )
  end

  def site_identity
    @site_name = SiteIdentity.first.site_name
  end

end
