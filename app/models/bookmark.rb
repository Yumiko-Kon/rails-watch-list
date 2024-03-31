class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id, message: "should be unique for a given movie/list couple" }

  # before_destroy :check_last_movie_in_list

  # private

  # def check_last_movie_in_list
  #   throw(:abort) if movie.lists.count == 1
  # end
end

# A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
# The comment of a bookmark cannot be shorter than 6 characters.
# A bookmark belongs to a movie
# A bookmark belongs to a list
# You can’t delete a movie if it is referenced in at least one bookmark.
# When you delete a list, you should delete all associated bookmarks (but not the movies as they can be referenced in other lists).
