module FuncansHelper
  def signed_in?
    session[:user_id].present?
  end

  def emoji(type, opt = nil)
    if opt == :iphone
      "&#x#{type.camelize.constantize.emoji_code}"
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
