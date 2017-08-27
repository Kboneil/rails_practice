module ApplicationHelper
  def current_user_email
    session[:current_user_email]
  end
  def current_gravatar
    session[:current_gravatar]
  end
end
