require 'test_helper'

class BooksControllerTest < ActionController::TestCase
=begin
  test "diff check" do
    assert_difference 'Book.count', 1 do
      post :create, book: { isbn: '978-4-7741-4223-0',
        title: 'Rubyポケットリファレンス', price: 3000,
        publish: '제이펍' }
    end
  end
=end


=begin
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, book: { cd: @book.cd, isbn: @book.isbn, price: @book.price, publish: @book.publish, published: @book.published, title: @book.title }
    end

    assert_redirected_to book_path(assigns(:book))
  end

  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    patch :update, id: @book, book: { cd: @book.cd, isbn: @book.isbn, price: @book.price, publish: @book.publish, published: @book.published, title: @book.title }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to books_path
  end
=end
end
