module FuncansHelper
  def signed_in?
    session[:user_id].present?
  end
end
