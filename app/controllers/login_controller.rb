class LoginController < ApplicationController
   skip_before_action :check_logined

  def auth
    usr = User.authenticate(params[:username], params[:password])
    if usr then
      reset_session
      session[:usr] = usr.id
      redirect_to params[:referer]
    else
      flash.now[:referer] = params[:referer]
      @error = '사용자 이름／비밀번호가 틀렸습니다.'
      render 'index'
    end
  end

  def logout
    reset_session
    redirect_to '/'
  end
end
