require 'test_helper'

class ReactionTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @movie = movies(:one)
  end

  test "should save valid reaction" do
    reaction = Reaction.new(user: @user, movie: @movie, status: :like)
    assert reaction.save, "Could not save a valid reaction"
  end

  test "should not save reaction without a user" do
    reaction = Reaction.new(movie: @movie, status: :like)
    assert_not reaction.save, "Saved the reaction without a user"
  end

  test "should not save reaction without a movie" do
    reaction = Reaction.new(user: @user, status: :like)
    assert_not reaction.save, "Saved the reaction without a movie"
  end

  test "should save reaction with valid status" do
    reaction = Reaction.new(user: @user, movie: @movie, status: :like)
    assert reaction.save, "Could not save the reaction with a valid status"
  end

  test "should not save reaction with invalid status" do
    reaction = Reaction.new(user: @user, movie: @movie, status: :invalid_status)
    assert_not reaction.save, "Saved the reaction with an invalid status"
  end

  test "should belong to a user" do
    reaction = reactions(:reaction1)
    assert_equal @user, reaction.user, "Reaction does not belong to the correct user"
  end

  test "should belong to a movie" do
    reaction = reactions(:reaction1)
    assert_equal @movie, reaction.movie, "Reaction does not belong to the correct movie"
  end
end
