require "application_system_test_case"

class SurveyFormsTest < ApplicationSystemTestCase
  setup do
    @survey_form = survey_forms(:one)
  end

  test "visiting the index" do
    visit survey_forms_url
    assert_selector "h1", text: "Survey Forms"
  end

  test "creating a Survey form" do
    visit survey_forms_url
    click_on "New Survey Form"

    fill_in "Department", with: @survey_form.department_id
    fill_in "Description", with: @survey_form.description
    fill_in "Name", with: @survey_form.name
    fill_in "Question", with: @survey_form.question
    click_on "Create Survey form"

    assert_text "Survey form was successfully created"
    click_on "Back"
  end

  test "updating a Survey form" do
    visit survey_forms_url
    click_on "Edit", match: :first

    fill_in "Department", with: @survey_form.department_id
    fill_in "Description", with: @survey_form.description
    fill_in "Name", with: @survey_form.name
    fill_in "Question", with: @survey_form.question
    click_on "Update Survey form"

    assert_text "Survey form was successfully updated"
    click_on "Back"
  end

  test "destroying a Survey form" do
    visit survey_forms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Survey form was successfully destroyed"
  end
end
