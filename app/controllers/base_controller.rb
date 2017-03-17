class BaseController < ApplicationController
  after_filter :flash_to_headers

  helper_method :current_item

  private

    def current_item
      @current_item ||= Item.find params[:item_id]
    end

    def flash_to_headers
      return unless request.xhr?
      response.headers['X-Message'] = flash_message
      response.headers["X-Message-Type"] = flash_type.to_s

      flash.discard # don't want the flash to appear when you reload page
    end

    def flash_message
      [:danger, :info, :success].each do |type|
        return flash[type] unless flash[type].blank?
      end
      return ''
    end

    def flash_type
      [:danger, :info, :success].each do |type|
        return type unless flash[type].blank?
      end
      return :empty
    end
end