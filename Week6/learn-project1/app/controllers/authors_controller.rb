# frozen_string_literal: true

require_relative '../../service/google_drive_service'

class AuthorsController < ApplicationController
  include Pagy::Backend
  before_action :set_author, only: %i[show edit update destroy]
  # GET /articles or /articles.json
  def index
    @q = Author.ransack(search_params)
    @q.sorts = 'title acs' if !@q.sorts.empty?

    @authors = @q.result(distinct: true)
    # Rails.logger.debug '============================'
    # Rails.logger.debug "============#{@authorr.inspect}============="
    # Rails.logger.debug '============================'
    # @authors = Author.all

    @pagy, @authors = pagy(@authors, items: 5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authors }
    end

    GoogleDriveService.new.upload_file_drive(url_for(Author.find(19).picture), 'author_19.png')
  end

  # GET /authors/1 or /authors/1.json
  def show
    if @author.nil?
      redirect_to books_url, notice: 'Author not found'
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @authors }
      end
    end
  end

  # GET /authors/new
  def new
    @author = Author.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /authors/1/edit
  def edit; end

  # POST /authors or /authors.json
  def create
    # book_params.inspect
    @author = Author.new(author_params)
    @author.books_count = 1

    respond_to do |format|
      if @author.save
        AuthorMailer.with(author: @author).welcome_email.deliver_now
        format.html { redirect_to authors_url, notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        errors_message = @author.errors.full_messages.join(', ')
        format.html { redirect_to new_author_url, notice: errors_message }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @author.update(book_params)
        format.html { redirect_to authors_url, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        errors_message = @author.errors.full_messages.join(', ')
        format.html { redirect_to edit_book_url, notice: errors_message }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @author.destroy!

    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_author
    @author = Author.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def author_params
    params.require(:author).permit(:first_name, :last_name, :title, :picture, :email, books_attributes:
    %i[title year_published price out_of_print views supplier_id])
  end

  def search_params
    params.fetch(:query, {}).permit(:first_name_or_title_cont, :s, :created_at_lt, :created_at_gt, :books_title_cont)
  end
end
