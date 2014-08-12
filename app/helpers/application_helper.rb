module ApplicationHelper

  def flash_alert
    flash[:alert] if flash[:alert]
  end
end
