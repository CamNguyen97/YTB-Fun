class PagesController < ApplicationController
  def home
    moviles = Movie.all.order(created_at: :desc)
    @movies = moviles.map do |movie|
      {
        movie_id: movie.id,
        movie_title: movie.title,
        movie_des: movie.description,
        movies_url: convert_youtube_url_to_embed(movie.url),
        share_by: movie.shared_by.email
      }
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def convert_youtube_url_to_embed(url)
    url_params = url.split('?').last.split('=')
    video_id = url_params.last
    
    embed_url = "https://www.youtube.com/embed/#{video_id}"
    
    return embed_url
  end
end
