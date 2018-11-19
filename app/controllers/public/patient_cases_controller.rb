class Public::PatientCasesController < ApplicationController
  before_action :set_patient_case, only: [:show, :symptoms, :diagnosis, :last_step, :summary, :edit, :update, :destroy]

  # GET /patient_cases/1
  # GET /patient_cases/1.json
  def show
  end

  def symptoms
    if params[:symptom_id].present?
      @symptoms = @potential_symptoms.where(parent_id: params[:symptom_id])
    else
      @symptoms = @potential_symptoms.base
    end

    if @symptoms.count == 0
      redirect_to diagnosis_patient_case_path(@patient_case, symptom_id: params[:symptom_id])
    end
  end

  def diagnosis
    _ensure_symptom
  end

  def summary
  end

  # GET /patient_cases/new
  def new
    @patient_case        = PatientCase.new
    @patient_case.age    = 35
    @patient_case.gender = 'female'
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
    redirect_path = symptoms_patient_case_path(@patient_case)  if params[:patient_case][:age].present?
    redirect_path = diagnosis_patient_case_path(@patient_case) if params[:patient_case][:diagnosis_id].present?
    redirect_path = summary_patient_case_path(@patient_case)   if params[:patient_case][:consideration_ids].present?

    if @patient_case.update(patient_case_params)
      redirect_to redirect_path, notice: 'Patient case was successfully updated.'
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

      @potential_symptoms  = @patient_case.potential_symptoms
      @potential_diagnosis = @patient_case.potential_diagnosis
      @considerations      = @patient_case.potential_considerations
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

    def _ensure_symptom
      unless params[:symptom_id].present?
        redirect_to symptoms_patient_case_path(@patient_case), notice: 'Describe your symptoms.'
      end
    end
end
