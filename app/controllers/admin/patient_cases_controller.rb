require 'admin/admin_controller.rb'
class Admin::PatientCasesController < AdminController
  
  def index
    @patient_cases = PatientCase.all
  end
end
