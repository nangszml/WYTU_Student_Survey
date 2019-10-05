class SurveyFormsController < ApplicationController
  before_action :set_survey_form, only: [:show, :edit, :update, :destroy]

  # GET /survey_forms
  # GET /survey_forms.json
  def index
    @survey_forms = SurveyForm.all
  end

  # GET /survey_forms/1
  # GET /survey_forms/1.json
  def show
  end

  # GET /survey_forms/new
  def new
    @survey_form = SurveyForm.new
    if params[:year].present?
      @survey_form = Student.where(class_name: params[:year])
    end
  end

  # GET /survey_forms/1/edit
  def edit
    # inspect @survey_form
    @survey_form.question = @survey_form.question.join(', ')
  end

  # POST /survey_forms
  # POST /survey_forms.json
  def create
    @survey_form = SurveyForm.new(survey_form_params)
    sf = SurveyForm.create(name: @survey_form.name, class_name: @survey_form.class_name, 
      department_id: @survey_form.department_id, question: @survey_form.question.split(","))
    respond_to do |format|
      if sf
        format.html { redirect_to @survey_form, notice: 'Survey form was successfully created.' }
        format.json { render :show, status: :created, location: @survey_form }
      else
        format.html { render :new }
        format.json { render json: @survey_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_forms/1
  # PATCH/PUT /survey_forms/1.json
  def update
    sf = @survey_form.update(name: params[:survey_form][:name], class_name: params[:survey_form][:class_name], 
      department_id: params[:survey_form][:department_id], question: params[:survey_form][:question].split(","))
    respond_to do |format|
      if sf
        format.html { redirect_to @survey_form, notice: 'Survey form was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_form }
      else
        format.html { render :edit }
        format.json { render json: @survey_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_forms/1
  # DELETE /survey_forms/1.json
  def destroy
    @survey_form.destroy
    respond_to do |format|
      format.html { redirect_to survey_forms_url, notice: 'Survey form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_form
      @survey_form = SurveyForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_form_params
      params.require(:survey_form).permit(:name, :description, :question, :department_id)
    end
end
