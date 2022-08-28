class BooksController < ApplicationController
  def top
  end
  
  def new
    @book = @Book.all
  
end
