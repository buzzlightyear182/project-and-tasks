module ApplicationHelper

  def flash_alert
    flash[:alert] if flash[:alert]
  end

  def user_session(current_user)
  	if current_user
			["Log-out", killsession_path, 'delete']
		else
			["Log-in", new_session_path, 'get']
		end
  end

  def print_menu
    log_item = user_session(current_user)
    all_menu = []
    menu_items = {}

    menu_items["Create a new project"] = [new_project_path, 'GET']
    menu_items[log_item[0]] = [log_item[1], log_item[2]]

    menu_items.each do |option_string, option_path|
      all_menu << link_to(option_string, option_path[0], class: "menu_button", method: option_path[1])
    end
    all_menu
  end

end