class CategorizesController < BaseController
  before_action :set_categorize, only: :destroy

  respond_to :html, :json

  def create
    @categorize = Categorize.new categorize_params

    if @categorize.valid? and @categorize.save
      flash[:success] = 'Category was successfully linked.'
    else
      flash[:danger] = 'There was a problem with your request.'
    end

    respond_with @categorize, location: nil
  end

  def destroy
    if @categorize.destroy
      flash[:success] = 'Category was successfully unlinked'
    else
      flash[:danger] = 'There was a problem with your request.'
    end

    respond_with @categorize, location: nil
  end

  private
    def set_categorize
      @categorize = current_item.categorizes.where(category_id: params[:categorize][:category_id]).first
    end

    def categorize_params
      params.fetch(:categorize, {}).permit(:category_id, :categorizable_id, :categorizable_type)
    end
end