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
end
