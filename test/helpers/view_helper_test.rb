require 'test_helper'

class ViewHelperTest < ActionView::TestCase
  test "format helper" do
    result = format_datetime(Time.now, :date)
    assert_match /\d{4}년 \d{1,2}월 \d{1,2}/, result
  end
end
