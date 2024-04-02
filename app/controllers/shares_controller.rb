class SharesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    url = params[:url]
    begin
      video_id = extract_video_id(url)
      youtube_service = YoutubeService.new(ENV["API_KEY_YTB"])
      video_info = youtube_service.fetch_video_info(video_id)
      
      if video_info
        movie = Movie.new(
          url: url,
          title: video_info[:title],
          description: video_info[:description],
          shared_by: current_user
        )
      
        if movie.save
          redirect_to root_path
        else
          redirect_to shares_path
        end
      else
        redirect_to shares_path
      end
    rescue StandardError => e
      redirect_to shares_path
    end
  end
  
  private
  
  def extract_video_id(url)
    match_data = url.match(/(?:https?:\/\/)?(?:www\.)?youtube\.com\/watch\?.*v=([a-zA-Z0-9_-]+)/)
    raise StandardError, "Invalid YouTube URL" unless match_data
    match_data[1]
  end
end
