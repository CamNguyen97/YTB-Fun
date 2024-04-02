require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  def setup
    @movie_one = movies(:one)
    @movie_two = movies(:two)
  end

  test "movie should be valid" do
    assert @movie_one.valid?
  end

  test "url should be present" do
    @movie_one.url = ""
    assert_not @movie_one.valid?
  end

  test "title should be present" do
    @movie_one.title = ""
    assert_not @movie_one.valid?
  end

  test "shared_by should be present" do
    @movie_one.shared_by = nil
    assert_not @movie_one.valid?
  end

  test "description can be optional" do
    @movie_one.description = nil
    assert @movie_one.valid?
  end

  test "should have many reactions" do
    assert_not @movie_one.reactions.empty?
    assert_not @movie_two.reactions.empty?
  end

  test "should broadcast notification after movie is shared" do
    assert_difference 'ActionCable.server.connections.size', 1 do
      @movie_one.notify_movie_shared
    end
  end
end
