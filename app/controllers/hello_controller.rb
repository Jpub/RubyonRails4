# coding: utf-8

class HelloController < ApplicationController
  before_action :check_logined, only: :view
  skip_before_action :check_logined, only: :list

  def index
    render text: 'Hello World..!'
  end

  def view
    @msg = 'Hello World..!'
    # render 'hello/special'
  end

  def list
    @books = Book.all
  end

  def app_var
    render text: MY_APP['logo']['source']
  end

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

end
