require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "sendmail_confirm" do
    user = User.find(6)
    mail = NoticeMailer.sendmail_confirm(user).deliver
    assert !ActionMailer::Base.deliveries.empty?
    assert_equal "사용자 등록 감사드립니다!", mail.subject
    assert_equal "testG@test.com", mail.to[0]
    assert_equal "webmaster@wings.msn.to", mail.from[0]
    assert_equal read_fixture('sendmail_confirm').join, mail.body.to_s
  end
end
