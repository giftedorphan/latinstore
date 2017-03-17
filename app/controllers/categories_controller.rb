class CategoriesController < BaseController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @categories = Category.all.order('created_at DESC').paginate(
                                      :page => params[:page], :per_page => 9)
    respond_with @categories
  end

  def create
    @category = Category.where(:name => category_params[:name].downcase).first_or_initialize

    if @category.new_record?
      @category.save
      flash[:success] = 'Category was successfully created.'
    else
      flash[:danger] = 'Category already exist.'
    end

    respond_with @category, location: categories_path
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = 'Category was successfully updated.'
      respond_with(@category, :location => categories_path, )
    else
      respond_to do |format|
        format.json { render json: @category.errors, status: 422 }
      end
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = 'Category was successfully deleted.'
    else
      flash[:danger] = 'There was a problem processing your request.'
    end

    respond_with @category
  end

  private
    def set_category
      @category = Category.find(params[:category_id])
    end

    def category_params
      params.fetch(:category, {}).permit(:name)
    end
end