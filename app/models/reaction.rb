class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  enum status: { like: true, dislike: false }
end

# == Schema Information
#
# Table name: reactions
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  movie_id   :bigint
#  status     :boolean          default("like")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
