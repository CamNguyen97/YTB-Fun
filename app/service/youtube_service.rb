# app/services/youtube_service.rb
require 'httparty'

class YoutubeService
  def initialize(api_key)
    @api_key = api_key
  end

  def fetch_video_info(video_id)
    response = HTTParty.get("https://www.googleapis.com/youtube/v3/videos?id=#{video_id}&part=snippet&key=#{@api_key}")

    if response.success?
      data = JSON.parse(response.body)
      title = data['items'][0]['snippet']['title']
      description = data['items'][0]['snippet']['description']
      { title: title, description: description }
    else
      false
    end
  end
end
