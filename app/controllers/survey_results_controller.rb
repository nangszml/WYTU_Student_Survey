class SurveyResultsController < ApplicationController
  before_action :set_survey_result, only: [:show, :edit, :update, :destroy]

  # GET /survey_results
  # GET /survey_results.json
  def index
    # @survey_results = SurveyResult.where(department_id: current_teacher.department_id)
    @survey_results = []
    @surveys = current_teacher.department.survey_forms
    @surveys.each  do |s|
      s.survey_results.each do |r|
        @survey_results << r
      end
    end 
    # inspect params
  end

  # GET /survey_results/1
  # GET /survey_results/1.json
  def show
  end

  # GET /survey_results/new
  def new
    # inspect params
    @survey_result = SurveyResult.new
    dept_id = current_student.department_id
    @survey_list = SurveyForm.where(department_id: dept_id, class_name: current_student.class_name).pluck(:name)
    if params[:class_survey_name].present?
      @survey_form = SurveyForm.find_by(department_id: dept_id, name: params[:class_survey_name])
      if @survey_form.present?
        @survey_form_id = @survey_form.id
        @questions = @survey_form.question
      end
    end
  end

  def create_survey_result
    @survey_form = SurveyForm.find_by(department_id: current_student.department_id, name: params[:class_survey_name])
    if @survey_form.present?
      @questions = @survey_form.question
    end
    # inspect params
    result = {}
    # questions = params[:questions].split("  ").reject { |c| c.empty? }
    @questions.each_with_index do |q,i|
      if i < 8
        result[q] = params["rating_#{i}"]
      else  
        result[q] =  params["#{q.strip}"]
      end 
    end
    puts result
    # inspect result
    survey_result = SurveyResult.create(survey_form_id: params[:survey_form_id].to_i, student_id: current_student.id, class_name: current_student.class_name, result: result)

    respond_to do |format|
      if survey_result.save
          format.html { render :success }
          # render "success"
          # format.json { render :show, status: :created, location: @survey_result }
      else
        format.html { render :new }
        format.json { render json: @survey_result.errors, status: :unprocessable_entity }
      end
    end 
  end

  # GET /survey_results/1/edit
  def edit
  end

  # POST /survey_results
  # POST /survey_results.json
  def create
    @survey_result = SurveyResult.new(survey_result_params)

    respond_to do |format|
      if @survey_result.save
        format.html { redirect_to @survey_result, notice: 'Survey result was successfully created.' }
        format.json { render :show, status: :created, location: @survey_result }
      else
        format.html { render :new }
        format.json { render json: @survey_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_results/1
  # PATCH/PUT /survey_results/1.json
  def update
    respond_to do |format|
      if @survey_result.update(survey_result_params)
        format.html { redirect_to @survey_result, notice: 'Survey result was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_result }
      else
        format.html { render :edit }
        format.json { render json: @survey_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_results/1
  # DELETE /survey_results/1.json
  def destroy
    @survey_result.destroy
    respond_to do |format|
      format.html { redirect_to survey_results_url, notice: 'Survey result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_result
      @survey_result = SurveyResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_result_params
      params.require(:survey_result).permit(:survey_form_id, :result, :student_id, :class)
    end
end
