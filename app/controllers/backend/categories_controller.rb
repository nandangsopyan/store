class Backend::CategoriesController < BackendController
  before_action :authenticate_user!
  before_action :site_identity

  def index
    @categories = Category.order(id: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = 'Category successfully added'
      redirect_to backend_categories_path
    else
      flash[:danger] = "Oops...something wrong, err-- #{@category.errors.full_messages}"
      render 'new'
    end
  end

  def edit 
    @category = Category.friendly.find(params[:id])
  end

  def update
    @category = Category.friendly.find(params[:id])

    if @category.update(category_params)
      flash[:success] = 'Category successfully updated'
      redirect_to backend_categories_path
    else
      flash[:danger] = "Oops...something wrong, --err: #{@category.errors.full_messages}"
      render 'new'
    end
  end

  def destroy
    @category = Category.friendly.find(params[:id])

    if @category.destroy
      flash[:success] = 'Category successfully deleted'
      redirect_to request.referer
    else
      flash[:danger] = "Oops...something wrong, --err: #{@category.errors.full_messages}"
      redirect_to request.referer
    end
  end


  private

  def category_params
    params.require(:category).permit(:name, :description, :category_keyword)
  end

  def site_identity
    @site_name = SiteIdentity.first.site_name
  end
end
