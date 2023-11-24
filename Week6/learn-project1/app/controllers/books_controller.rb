# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  # GET /articles or /articles.json
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /articles/1 or /articles/1.json
  def show
    if @book.nil?
      redirect_to books_url, notice: 'Book not found'
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @books }
      end
    end
  end

  # GET /articles/new
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles or /articles.json
  def create
    book_params.inspect
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to books_url, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        errors_message = @book.errors.full_messages.join(', ')
        format.html { redirect_to new_book_url, notice: errors_message }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to books_url, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        errors_message = @book.errors.full_messages.join(', ')
        format.html { redirect_to edit_book_url, notice: errors_message }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.fetch(:book, {}).permit(:title, :year_published, :price, :out_of_print, :views, :author_id, :supplier_id, :content)
  end
end
