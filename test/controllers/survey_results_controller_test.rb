require 'test_helper'

class SurveyResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey_result = survey_results(:one)
  end

  test "should get index" do
    get survey_results_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_result_url
    assert_response :success
  end

  test "should create survey_result" do
    assert_difference('SurveyResult.count') do
      post survey_results_url, params: { survey_result: { class: @survey_result.class, result: @survey_result.result, student_id: @survey_result.student_id, survey_form_id: @survey_result.survey_form_id } }
    end

    assert_redirected_to survey_result_url(SurveyResult.last)
  end

  test "should show survey_result" do
    get survey_result_url(@survey_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_result_url(@survey_result)
    assert_response :success
  end

  test "should update survey_result" do
    patch survey_result_url(@survey_result), params: { survey_result: { class: @survey_result.class, result: @survey_result.result, student_id: @survey_result.student_id, survey_form_id: @survey_result.survey_form_id } }
    assert_redirected_to survey_result_url(@survey_result)
  end

  test "should destroy survey_result" do
    assert_difference('SurveyResult.count', -1) do
      delete survey_result_url(@survey_result)
    end

    assert_redirected_to survey_results_url
  end
end
