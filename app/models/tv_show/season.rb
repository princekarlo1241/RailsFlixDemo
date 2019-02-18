class TVShow::Season < ApplicationRecord
  belongs_to :tv_show

  scope :ordered, -> { order(number: :asc) }

  def poster?
    poster_path.present?
  end

  def poster_url(version="original")
    tmdb_image(poster_path, version)
  end

  def tmdb_image(path, version="original")
    "https://image.tmdb.org/t/p/#{version}#{path}"
  end
end
