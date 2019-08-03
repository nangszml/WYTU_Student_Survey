require 'test_helper'

class SurveyFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey_form = survey_forms(:one)
  end

  test "should get index" do
    get survey_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_form_url
    assert_response :success
  end

  test "should create survey_form" do
    assert_difference('SurveyForm.count') do
      post survey_forms_url, params: { survey_form: { department_id: @survey_form.department_id, description: @survey_form.description, name: @survey_form.name, question: @survey_form.question } }
    end

    assert_redirected_to survey_form_url(SurveyForm.last)
  end

  test "should show survey_form" do
    get survey_form_url(@survey_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_form_url(@survey_form)
    assert_response :success
  end

  test "should update survey_form" do
    patch survey_form_url(@survey_form), params: { survey_form: { department_id: @survey_form.department_id, description: @survey_form.description, name: @survey_form.name, question: @survey_form.question } }
    assert_redirected_to survey_form_url(@survey_form)
  end

  test "should destroy survey_form" do
    assert_difference('SurveyForm.count', -1) do
      delete survey_form_url(@survey_form)
    end

    assert_redirected_to survey_forms_url
  end
end
