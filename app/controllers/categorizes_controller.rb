class CategorizesController < BaseController

  respond_to :html, :json

  def create
    @categorize = Categorize.new categorize_params

    if @categorize.valid? and @categorize.save
      flash[:notice] = "Category was successfully added"
    else
      flash[:error] = "There was a problem with your request"
    end

    respond_with @categorize, location: nil
  end

  def destroy
    @categorize = Tagging.find params[:id]

    if @categorize.destroy
      flash[:notice] = "Category was successfully removed"
    else
      flash[:error] = "There was a problem with your request"
    end

    respond_with @categorize, location: nil
  end

  private
    def set_categorize
      @categorize = Categorize.find(params[:id])
    end

    def categorize_params
      params.fetch(:categorize, {}).permit(:category_id, :categorizable_id, :categorizable_type)
    end
end