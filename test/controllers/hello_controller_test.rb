require 'test_helper'

class HelloControllerTest < ActionController::TestCase

  test "list action" do
    get :list
    assert_equal 10, assigns(:books).length, 'found rows is wrong.'
    assert_response :success, 'list action failed.'
    assert_template 'hello/list'
  end


=begin
  test "routing check" do
    assert_generates('hello/list',
      { controller: 'hello', action: 'list' })
    # assert_recognizes({ controller: 'hello', action: 'list' }, 'hello/list')
  end
=end

=begin
  test "select check" do
    get :list
    assert_select 'title'
    assert_select 'title', true
    assert_select 'font', false
    assert_select 'title', 'Railbook'
    assert_select 'title', /[A-Za-z0-9]+/
    assert_select 'script[data-turbolinks-track=?]', /.+/
    assert_select 'table tr[style]', 10
    assert_select 'table' do
      assert_select 'tr[style]', 1..10
    end
    assert_select 'title', { count: 1, text: 'Railbook' }
  end
=end

end
