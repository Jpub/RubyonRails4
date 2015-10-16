class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :check_logined
  # rescue_from ActiveRecord::RecordNotFound, with: :id_invalid
  # before_action :detect_locale
  # add_flash_types :info
  # skip_before_action :my_logging

  # def default_url_options(options = {})
  #  { locale: I18n.locale }
  # end

  private
  def check_logined
    if session[:usr] then
      begin
        @usr = User.find(session[:usr])
      rescue ActiveRecord::RecordNotFound
        reset_session
      end
    end
    unless @usr
      flash[:referer] = request.fullpath
      redirect_to controller: :login, action: :index
    end
  end

  def id_invalid(e)
    render 'shared/record_not_found', status: 404
  end


  def detect_locale
     I18n.locale = request.headers['Accept-Language'].scan(/\A[a-z]{2}/).first
    # I18n.locale = params[:locale]
     I18n.locale = :ko
  end
end
