class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  def new
    @movies = Movie.all
    @bookmark = Bookmark.new
    # @list = List.find(params[:list_id])
    @list = List.find(params[:list_id])
    # >> params
    # => #<ActionController::Parameters {"controller"=>"bookmarks", "action"=>"new", "list_id"=>"99"} permitted: false>
  end
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @List= List.find(params[:list_id])
     @bookmark.list = @list

     @bookmark.save
     puts @bookmark.errors.full_messages
     redirect_to list_path(@list)

  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)

  end
end
