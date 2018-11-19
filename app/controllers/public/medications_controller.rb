class Public::MedicationsController < ApplicationController

  before_action :_set_medication
  def show
  end

  private
  def _set_medication
    @medication = Medication.find(params[:id])
  end
end
