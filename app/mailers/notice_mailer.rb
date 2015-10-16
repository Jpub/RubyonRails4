class NoticeMailer < ActionMailer::Base
  # layout 'mail'

  default from: 'webmaster@wings.msn.to',
          cc: 'CQW15204@nifty.com'
  def sendmail_confirm(user)
    @user = user
    # attachments['seal.jpg'] =
    #   File.read(Rails.root.join('tmp/data/seal.jpg'))
    # attachments.inline['wings.jpg'] =
    #   File.read(Rails.root.join('tmp/data/wings.jpg'))
     mail(to: user.email,
          subject: '사용자 등록 감사드립니다!')

    # headers[:reply_to] = 'hoge@wings.msn.to'
    # headers({ reply_to: 'hoge@wings.msn.to',  bcc: 'nami@wings.msn.to'})

    # @user = user
    # mail(to: user.email,
    #     subject: '사용자 등록 감사드립니다!') do |format|
    #   format.text { render inline: 'HTML 대응 메일 클라이언트를 사용해주세요!' }
    #   format.html
    # end

  end
end
