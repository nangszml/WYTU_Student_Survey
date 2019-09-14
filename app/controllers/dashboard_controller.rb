class DashboardController < ApplicationController
  def index
    dept_id = current_teacher.department_id
    survey_form = SurveyForm.where(department_id: dept_id).last
    if survey_form.present?
    @questions = survey_form.question
    @survey_results = survey_form.survey_results
    @result = {}
    
      @questions.each do |q|
        @result[q.strip] = Hash.new
        @result[q.strip]["A"] = 0
        @result[q.strip]["B"] = 0
        @result[q.strip]["C"] = 0
        @result[q.strip]["D"] = 0
        @result[q.strip]["E"] = 0
      end
    end 
    
    if @survey_results.present?
    @survey_results.each do |r|
      r.result.each do |k,v|
        puts k,v
        if v == "A"
          @result[k.strip]["A"] += 1
        end
        if v == "B"
          @result[k.strip]["B"] += 1
        end
        if v == "C"
          @result[k.strip]["C"] += 1
        end
        if v == "D"
          @result[k.strip]["D"] += 1
        end
        if v == "E"
          @result[k.strip]["E"] += 1
        end
      end
    end
    end

  end
end
