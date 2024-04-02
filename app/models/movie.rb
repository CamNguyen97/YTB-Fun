class Movie < ApplicationRecord
  belongs_to :shared_by, class_name: 'User'
  has_many :reactions

  validates :url, presence: true
  validate :youtube_url_format

  after_create :notify_movie_shared

  def notify_movie_shared
    ActionCable.server.broadcast(
      'notifications_channel',
      { title: self.title, shared_by: self.shared_by.email }
    )
  end

  private

  def youtube_url_format
    unless url =~ /^(https?\:\/\/)?(www\.youtube\.com|youtu\.?be)\/.+$/i
      errors.add(:url, "must be a valid YouTube URL")
    end
  end
end

# == Schema Information
#
# Table name: movies
#
#  id           :bigint           not null, primary key
#  url          :string
#  title        :string
#  shared_by_id :bigint
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
