class BooksController < ApplicationController

  before_action :set_book, only: %i[ show ]

  @@per_page_pagination = 16

  def index
    if params[:search]
      @books = Book.search(params[:search])
      .paginate(:page => params[:page], per_page: @@per_page_pagination)
    else
      @books = Book.all
      .paginate(:page => params[:page], per_page: @@per_page_pagination)
    end
  end

  def show
  end

  def new
    @book = Book.new
    @book.build_tag
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private
   
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :year, :description, :cover, :content, :tag_attributes => [:semester, :course, :others, :degree])
    end
    
end
