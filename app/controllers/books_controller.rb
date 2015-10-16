class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # layout 'product'
  # GET /books
  # GET /books.json
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books }
      format.atom
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json

=begin
  def create
    @book = Book.new(book_params)
    raise '예외 발생' unless @book.valid?
  end
=end

  def create
    # @book = Book.new
    # @book.isbn      = params[:book][:isbn]
    # @book.title     = params[:book][:title]
    # @book.price     = params[:book][:price]
    # @book.publish   = params[:book][:publish]
    # @book.published = params[:book][:published]
    # @book.cd        = params[:book][:cd]

    # render text: params[:book].inspect
    # return

    @book = Book.new(book_params)
    # @book = Book.new(params[:book])


    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        # format.html { redirect_to @book, info: 'Book was successfully created.' }

        # format.html {
        #   flash[:msg] = 'Book was successfully created.'
        #   redirect_to @book
        # }

        format.json { render action: 'show', status: :created, location: @book }
      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json

=begin
  def update
    @book = Book.find(params[:id])
    @book.isbn      = params[:book][:isbn]
    @book.title     = params[:book][:title]
    @book.price     = params[:book][:price]
    @book.publish   = params[:book][:publish]
    @book.published = params[:book][:published]
    @book.cd        = params[:book][:cd]
    respond_to do |format|
      if @book.save
      # if @book.attributes = book_params
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
=end

  def update
    # sleep 3
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end


=begin

  # @books.attributes = params[:book]

  # @book.update_attribute(:title, 'Rails 4 입문')

  respond_to do |format|
    if @book.save
      format.html { redirect_to(@book, :notice => 'Book was successfully created.') }
      format.xml  { render :xml => @book, :status => :created, :location => @book }
    else
      format.html { render :action => "new" }
      format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
    end
  end
end
=end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    # Book.destroy(params[:id])
    # Book.delete(params[:id])
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:isbn, :title, :price, :publish, :published, :cd)
    end
end
