require "test_helper"

class PublicFeedbacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feedback = feedbacks(:one)
  end

  test "should not get index" do
    get feedbacks_url
    assert_response :not_found
  end

  test "should get new" do
    get new_feedback_url
    assert_response :success
  end

  test "should create feedback" do
    assert_difference("Feedback.count") do
      post feedbacks_url, params: { feedback: { name: @feedback.name, category: @feedback.category, comment: @feedback.comment, country: @feedback.country, email: @feedback.email, phone: @feedback.phone, url: @feedback.url } }
      if assigns(:feedback)&.errors&.any?
        puts "\n--- FEEDBACK VALIDATION ERRORS ---"
        puts assigns(:feedback).errors.full_messages
        puts "---------------------------------\n"
      else 
        puts "---No errors--------\n"
      end
    end

    #assert_redirected_to referer_url
    assert_response :redirect

    
  end

  test "should not show feedback" do
    get "/feedbacks/#{@feedback.id}"
    assert_response :not_found
  end

  test "should not get edit" do
    get "/feedbacks/#{@feedback.id}/edit"
    assert_response :not_found
  end

  test "should not update feedback" do
    patch feedback_url(@feedback), params: { feedback: { category: @feedback.category, comment: @feedback.comment, country: @feedback.country, email: @feedback.email, phone: @feedback.phone, url: @feedback.url } }
    assert_response :not_found
  end

  test "should not destroy feedback" do
    assert_difference("Feedback.count", 0) do
      delete feedback_url(@feedback)
    end

    assert_response :not_found
  end
end

class AdminFeedbacksControllerTest  < AuthenticatedIntegrationTest
  setup do
    @feedback = feedbacks(:one)
  end

  test "should get index" do
    get admin_feedbacks_url
    assert_response :success
  end
end
