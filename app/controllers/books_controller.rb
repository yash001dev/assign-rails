class BooksController < ApplicationController
  before_action :get_author
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @books = @author.books
  end

  def show
  end

  def new
    @book = @author.books.build
  end

  def edit
  end

  def create
    @book = @author.books.build(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to author_books_path(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to author_book_path(@author), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to author_books_path(@author), notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_author
    @book = @author.books.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :author_id)
  end

  def get_author
    @author = Author.find(params[:author_id])
  end
end
