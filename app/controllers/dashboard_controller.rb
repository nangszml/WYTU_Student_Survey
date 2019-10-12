class DashboardController < ApplicationController
  def index
    dept_id = current_teacher.department_id
    @dashboard_result = []
    if params[:year].present?
      surveys = SurveyForm.where(department_id: dept_id, class_name: params[:year])
      if surveys.present?

        surveys.each do |survey_form|
          @questions = survey_form.question
          @survey_results = survey_form.survey_results
          @result = {}
        
          @questions.each_with_index do |q, i|
            if i < 8
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
            r.result.each_with_index do  |(k, v), i|
              if i < 8
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

          dd = {}
          dd['name'] =  survey_form.name
          dd['result'] = @result

          @dashboard_result << dd
        end
      end 
      

    end

  end
end
