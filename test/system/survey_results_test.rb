require "application_system_test_case"

class SurveyResultsTest < ApplicationSystemTestCase
  setup do
    @survey_result = survey_results(:one)
  end

  test "visiting the index" do
    visit survey_results_url
    assert_selector "h1", text: "Survey Results"
  end

  test "creating a Survey result" do
    visit survey_results_url
    click_on "New Survey Result"

    fill_in "Class", with: @survey_result.class
    fill_in "Result", with: @survey_result.result
    fill_in "Student", with: @survey_result.student_id
    fill_in "Survey form", with: @survey_result.survey_form_id
    click_on "Create Survey result"

    assert_text "Survey result was successfully created"
    click_on "Back"
  end

  test "updating a Survey result" do
    visit survey_results_url
    click_on "Edit", match: :first

    fill_in "Class", with: @survey_result.class
    fill_in "Result", with: @survey_result.result
    fill_in "Student", with: @survey_result.student_id
    fill_in "Survey form", with: @survey_result.survey_form_id
    click_on "Update Survey result"

    assert_text "Survey result was successfully updated"
    click_on "Back"
  end

  test "destroying a Survey result" do
    visit survey_results_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Survey result was successfully destroyed"
  end
end
