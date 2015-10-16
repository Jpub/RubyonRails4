class ExtraController < ApplicationController

  def sendmail
    user = User.find(6)
    @mail = NoticeMailer.sendmail_confirm(user).deliver
    render text: '메일이 정상적으로 전송되었습니다.'
  end

  def paging
    @books = Book.order('published DESC').
      paginate(page: params[:page], per_page: 5)
  end
end
