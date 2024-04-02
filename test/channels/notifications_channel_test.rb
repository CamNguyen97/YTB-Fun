require 'test_helper'

class NotificationsChannelTest < ActionCable::Channel::TestCase
  test "subscribes to notifications channel" do
    user = users(:example_user)
    
    # Simulate a subscription request to the NotificationsChannel
    subscribe
    
    # Assert that the subscription was successful
    assert_has_stream "notifications_channel"
  end
  
  test "unsubscribes from notifications channel" do
    user = users(:example_user)
    
    # Simulate a subscription request to the NotificationsChannel
    subscribe
    
    # Simulate an unsubscription request from the NotificationsChannel
    unsubscribe
    
    # Assert that the unsubscription was successful
    assert_no_streams
  end
end
