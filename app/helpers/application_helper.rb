module ApplicationHelper

  def flash_alert
    flash[:alert] if flash[:alert]
  end

  def user_session(current_user)
  	if current_user
			[content_tag(:p, "Hello #{current_user.username}"),
				link_to("Logout", killsession_path, method: 'delete', class: "logout")]
		else
			[content_tag(:a, "Log-in", href: new_session_path)]
		end

  	# else
  	# 	return "<a href=\"#{new_session_path}\"><button>Log-in</button></a>".html_safe
  	# end
  end

end
