require 'kconv'

class CtrlController < ApplicationController
   # before_action :auth, only: :index
  # before_action :start_logger
  # before_action :start_logger, only: [:index, :index2]
  # before_action :auth, only: :index
  # around_action :around_logger
  # after_action :end_logger
  # after_action :end_logger, except: :index
  # before_action :my_logging
  # skip_action_callback :my_logging
  # skip_action_callback :start_logger, :end_logger
  # skip_before_action :my_logging
  # skip_before_action :my_logging, only: :index

  def para
    render text: 'id 매개 변수: ' + params[:id]
  end

  def para_array
    render text: 'category 매개 변수: ' + params[:category].inspect
  end

  def req_head
    render text: request.headers['User-Agent']
  end

  def req_head2
    @headers = request.headers
  end

  def upload_process
    file = params[:upfile]
    name = file.original_filename
    ext = name[name.rindex('.') + 1, 4].downcase
    perms = ['.jpg', '.jpeg', '.gif', '.png']
    if !perms.include?(File.extname(name).downcase)
      result = '그림 파일만 업로드 해주세요.'
    elsif file.size > 1.megabyte
      result = '파일 사이즈는 1MB까지입니다.'
    else
      File.open("public/docs/#{name}", 'wb') { |f| f.write(file.read) }
      result = "#{name.toutf8}를 업로드 했습니다."
    end
    render text: result
  end

  def updb
    @author = Author.find(params[:id])
  end

  def updb_process
    @author = Author.find(params[:id])
    if @author.update(params.require(:author).permit(:data))
    #if @author.update_attributes(params.require(:author).permit(:data))

      render text: '저장에 성공했습니다.'
    else
      render text: @author.errors.full_messages[0]
    end
  end

  def double_render
    @book = Book.find(6)
    if @book.reviews.empty?
      # render 'simple_info'
      render 'simple_info' and return
    end
    render 'details_info'
  end

  def res_render
     render action: :index
    # render 'hello/view'
    # render file: 'data/template/list'
    # render 'index'
    # render 'hello/view'
    # render 'data/template/list'
    # render text: '오늘은 좋은 날씨네요.'
    # render inline: '요청 정보: <%= debug request.headers %>'
    # render nothing: true, status: 404
    # head 404
    # head :not_found
  end

  def redirect
     redirect_to 'http://www.wings.msn.to'
    # redirect_to action: :index
    # redirect_to controller: :hello, action: :list
    # redirect_to books_path
    # redirect_to :back
  end

  def filesend
    # send_file 'c:/data/sample.zip'
    # send_file 'c:/data/RIMG1125.jpg',
    # type: 'image/jpeg', disposition: :inline
     send_file 'c:/data/doc931455.pdf', filename: 'Guideline.pdf'
  end

  def show_photo
    id = params[:id] ? params[:id] : 1
    @author = Author.find(id)
    send_data @author.photo, type: @author.ctype, disposition: :inline
  end

  def log
    logger.unknown('unknown')
    logger.fatal('fatal')
    logger.error('error')
    logger.warn('warn')
    logger.info('info')
    logger.debug('debug')
    render text: '로그는 콘솔 또는 로그 파일에서 확인해주세요.'
  end

  def get_xml
    @books = Book.all
    render xml: @books
  end

  def get_json
    @books = Book.all
    render json: @books
  end

  def download
    @books = Book.all
  end

  def cookie
    @email = cookies[:email]
  end

  def cookie_rec
    cookies[:email] = { value: params[:email],
    # cookies.permanent.encrypted[:email] = { value:  params[:email],
      expires: 3.months.from_now, http_only: true }
    render text: '쿠키를 저장했습니다.'
  end

  def session_show
    @email = session[:email]
  end

  def session_rec
    session[:email] = params[:email]
    render text: '세션을 저장했습니다.'
  end

  def index
    sleep 3
    render text: 'index 액션이 실행되었습니다.'
  end

  def index2
    sleep 3
    render text: 'index 액션이 실행되었습니다.'
  end


  private
  def start_logger
    logger.debug('[Start] ' + Time.now.to_s)
    # render text: 'スTop'
  end

  def end_logger
    logger.debug('[Finish] ' + Time.now.to_s)
  end

  def around_logger
    logger.debug('[Start1] ' + Time.now.to_s)
    yield
    logger.debug('[Finish1] ' + Time.now.to_s)
  end

  def my_logging
        logger.debug('[MyLog] ' + Time.now.to_s)
  end



  def auth
    name = 'arint'
    passwd = '8cb2237d0679ca88db6464eac60da96345513964'
    authenticate_or_request_with_http_basic('Railsbook') do |n, p|
      n == name &&
        Digest::SHA1.hexdigest(p) == passwd
    end
  end


  #def auth
  #  members = { 'arint' => '47449ae3e102927e4fab12a5549ed5d7' }
  #  authenticate_or_request_with_http_digest('railbook') do |name|
  #    members[name]
  #  end
  #end

end
