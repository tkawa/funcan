module FuncansHelper
  def signed_in?
    session[:user_id].present?
  end

  def from_ios?
    request.user_agent.include?('iPhone') ||
    request.user_agent.include?('iPad') ||
    request.user_agent.include?('iPod')
  end

  def emoji(type, opt = nil)
    if from_ios? || opt == :ios
      content_tag :span, "&#x#{type.camelize.constantize.emoji_code}", {class: 'emoji'}, false
    else
      image_tag "#{type.camelize.constantize.emoji_code}.png", alt: '', class: 'emoji'
    end
  end

  def list_active_if_current(body, url_options = {}, html_options = {})
    content_tag :li, class: current_page?(url_options) ? 'active' : nil do
      link_to body, url_options, html_options
    end
  end
end
