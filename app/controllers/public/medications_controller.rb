class Public::MedicationsController < ApplicationController

  before_action :_set_medication
  def show
    if params[:patient_case_id]
      @patient_case          = PatientCase.find(params[:patient_case_id])
      @diagnosis             = @patient_case.diagnosis
      @secondary_medications = @diagnosis.secondary_medications.where(id: @patient_case.potential_medications.ids)
    end
  end

  private
  def _set_medication
    @medication = Medication.find(params[:id])
  end
end
