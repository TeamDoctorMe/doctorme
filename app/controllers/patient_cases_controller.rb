class PatientCasesController < ApplicationController
  before_action :set_patient_case, only: [:show, :symptoms, :diagnosis, :summary, :edit, :update, :destroy]

  # GET /patient_cases
  # GET /patient_cases.json
  def index
    @patient_cases = PatientCase.all
  end

  # GET /patient_cases/1
  # GET /patient_cases/1.json
  def show
  end

  def symptoms
  end

  def diagnosis
  end

  def summary
  end


  # GET /patient_cases/new
  def new
    @patient_case = PatientCase.new
  end

  # GET /patient_cases/1/edit
  def edit
  end

  # POST /patient_cases
  # POST /patient_cases.json
  def create
    @patient_case = PatientCase.new(patient_case_params)

    respond_to do |format|
      if @patient_case.save
        format.html { redirect_to symptoms_patient_case_path(@patient_case), notice: 'Patient case was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /patient_cases/1
  # PATCH/PUT /patient_cases/1.json
  def update

    if @patient_case.update(patient_case_params)
      _set_redirect
      # redirect_to @patient_case, notice: 'Patient case was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /patient_cases/1
  # DELETE /patient_cases/1.json
  def destroy
    @patient_case.destroy
    respond_to do |format|
      format.html { redirect_to patient_cases_url, notice: 'Patient case was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_case
      @patient_case = PatientCase.find(params[:id])

      potential_symptoms = @patient_case.potential_symptoms
      @tier_1_symptoms   = potential_symptoms.within_age_range(@patient_case.age).base
      @tier_2_symptoms   = potential_symptoms.where(parent_id: @tier_1_symptoms.ids)
      @tier_3_symptoms   = potential_symptoms.where(parent_id: @tier_2_symptoms.ids)

      @considerations = @patient_case.potential_considerations
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_case_params
      params.require(:patient_case).permit(:gender,
                                           :age,
                                           :symptom_id,
                                           :diagnosis_id,
                                           :diagnosis_attributes,
                                           :medication_attributes,
                                           consideration_ids: [])
    end

    def _set_redirect
      if @patient_case.symptom.nil?
        redirect_to symptoms_patient_case_path(@patient_case), notice: 'Describe your symptoms.'
      elsif @patient_case.symptom.present? and @patient_case.considerations.nil?
        redirect_to diagnosis_patient_case_path(@patient_case), notice: 'Checkout Your diagnosis.'
      else
        redirect_to summary_patient_case_path(@patient_case), notice: 'Checkout Your diagnosis.'
      end
    end
end
