class TaggingsController < BaseController

  respond_to :html, :json

  def create
    @tagging = Tagging.new tagging_params

    if @tagging.valid? and @tagging.save
      flash[:notice] = "Tag was successfully added"
    else
      flash[:error] = "There was a problem with your request"
    end

    respond_with @tagging, location: nil
  end

  def destroy
    @tagging = Tagging.find params[:id]

    if @tagging.destroy
      flash[:notice] = "Tag was successfully removed"
    else
      flash[:error] = "There was a problem with your request"
    end

    respond_with @tagging, location: nil
  end

  private
    def set_tagging
      @tagging = Tagging.find(params[:id])
    end

    def tagging_params
      params.fetch(:tagging, {}).permit(:tag_id, :taggable_id, :taggable_type)
    end
end