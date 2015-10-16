require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "book save" do
    book = Book.new({
      isbn: '978-4-7741-4466-X',
      title: 'Ruby on Rails 입문',
      price: 3100,
      publish: '제이펍',
      published: '2014-02-14',
      cd: false
    })
    assert book.save, 'Failed to save'
  end

=begin
  test "book validate" do
    book = Book.new({
      isbn: '978-4-7741-44',
      title: 'Ruby on Rails 입문',
      price: 3100,
      publish: '제이펍',
      published: '2014-02-14',
      cd: false
    })
    assert !book.save, 'Failed to validate'
    assert_equal book.errors.size, 2, 'Failed to validate count'
    assert book.errors[:isbn].any?, 'Failed to isbn validate'
  end
=end

=begin
  test "where method test" do
    result = Book.find_by(title: '자바스크립트 라이브러리 실전 활용')
    assert_instance_of Book, result ,'result is not instance of Book'
    assert_equal books(:jslib).isbn, result.isbn, 'isbn column is wrong.'
    assert_equal Date.new(2013, 03, 19), result.published,
      'published column is wrong.'
  end
=end

=begin
   def setup
     @b = books(:jslib)
   end

   def teardown
     @b = nil
   end

  test "where method test" do
    result = Book.find_by(title: '자바스크립트 라이브러리 실전 활용')
    assert_instance_of Book, result ,'result is not instance of Book'
    assert_equal @b.isbn, result.isbn, 'isbn column is wrong.'
    assert_equal @b.published, result.published, 'published column is wrong.'
  end
=end

end
