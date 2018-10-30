class PatientCasesController < ApplicationController
  before_action :set_patient_case, only: [:show, :edit, :update, :destroy]

  # GET /patient_cases
  # GET /patient_cases.json
  def index
    @patient_cases = PatientCase.all
  end

  # GET /patient_cases/1
  # GET /patient_cases/1.json
  def show
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
        format.html { redirect_to @patient_case, notice: 'Patient case was successfully created.' }
        format.json { render :show, status: :created, location: @patient_case }
      else
        format.html { render :new }
        format.json { render json: @patient_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_cases/1
  # PATCH/PUT /patient_cases/1.json
  def update
    respond_to do |format|
      if @patient_case.update(patient_case_params)
        format.html { redirect_to @patient_case, notice: 'Patient case was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient_case }
      else
        format.html { render :edit }
        format.json { render json: @patient_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_cases/1
  # DELETE /patient_cases/1.json
  def destroy
    @patient_case.destroy
    respond_to do |format|
      format.html { redirect_to patient_cases_url, notice: 'Patient case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_case
      @patient_case = PatientCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_case_params
      params.require(:patient_case).permit(:gender, :age, :symptom_id, :diagnosis_id, :diagnosis_attributes, :medication_attributes)
    end
end
