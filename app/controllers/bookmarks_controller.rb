class BookmarksController < ApplicationController
  # before_action :set_list, only: [:new, :create, :destroy]

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id]) # Needs list per list-Id
    @movie = Movie.find(params[:bookmark][:movie_id]) # Needs movie per movie-id
    @comment = params[:bookmark][:comment]
    @bookmark = Bookmark.new(list: @list, movie: @movie, comment: @comment) # Creates new bookmark with those two
    @bookmark.save # And saves it.
    redirect_to list_path(@list) # Redirects to list show.html.erb
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id]) # Defines the bookmark by id. Used in methods defined above in before_action
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list)
  end

end
