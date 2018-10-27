class Backend::SlidersController < BackendController
  before_action :authenticate_user!
  before_action :site_identity

  def index
    @sliders = Slider.order(id: :desc)
  end

  def new
    @slider = Slider.new
  end

  def create
    @slider = Slider.new(slider_params)

    if params[:publish]
      @slider.published = 1
    else
      @slider.published = 0
    end

    if @slider.save
      if @slider.published?
        flash[:success] = 'Image slider successfully added & published'
        redirect_to backend_sliders_path
      else
        flash[:success] = 'Image slider successfully added & saved as draft'
        redirect_to backend_sliders_path
      end
    else
      flash[:danger] = "Oops... something wrong :(. --err: #{@slider.errors.full_messages}" 
      redirect_to backend_sliders_path
    end
  end

  def edit
    @slider = Slider.find(params[:id])
  end

  def update
    @slider = Slider.find(params[:id])

    if params[:publish]
      @slider.published = 1
    else
      @slider.published = 0
    end

    if @slider.update(slider_params)
      if @slider.published?
        flash[:success] = 'Slider updated and published'
        redirect_to backend_sliders_path
      else
        flash[:sucess] = 'Slider updated and saved as draft'
        redirect_to backend_sliders_path
      end
    else
      flash[:danger] = "Oops... something wrong :( - err: #{@slider.errors.full_messages}"
      redirect_to backend_sliders_path
    end
  end

  def destroy
    @slider = Slider.find(params[:id])

    if @slider.destroy
      flash[:success] = 'Slider successfully deleted'
      redirect_to request.referer
    else
      flash[:danger] = "Oops... something wrong. :err-- #{@product.errors.full_messages}"
    end
  end

  private

  def slider_params
    params.require(:slider).permit(:name, :image, :url, :image_alt, :published)
  end

  def site_identity
    @site_name = SiteIdentity.first.site_name
  end
end
