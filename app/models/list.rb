class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end

# A list must have a unique name.
# A list has many bookmarks
# A list has many movies through bookmarks
# When you delete a list, you should delete all associated bookmarks (but not the movies as they can be referenced in other lists).

  # has_many :bookmarks, dependent: :destroy
  # has_many :movies, through: :bookmarks
  # validates :name, presence: true, uniqueness: true


# A movie must have a unique title and an overview.
# A movie has many bookmarks
# When you delete a list, you should delete all associated
#  bookmarks (but not the movies as they can be referenced
#   in other lists).

  # has_many :bookmarks
  # validates :title, :overview, presence: true, uniqueness: true
