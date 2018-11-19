require 'admin/admin_controller.rb'
class Admin::SymptomsController < AdminController
  before_action :set_symptom, only: [:show, :edit, :update, :destroy]

  # GET /symptoms
  # GET /symptoms.json
  def index
    if params[:symptom_id]
      @current_symptom = Symptom.find(params[:symptom_id])
      @symptoms        = @current_symptom.symptoms
    else
      @symptoms = Symptom.base
    end
  end

  # GET /symptoms/1
  # GET /symptoms/1.json
  def show
  end

  # GET /symptoms/new
  def new
    @symptom = Symptom.new
  end

  # GET /symptoms/1/edit
  def edit
  end

  # POST /symptoms
  # POST /symptoms.json
  def create
    @symptom = Symptom.new(symptom_params)

    respond_to do |format|
      if @symptom.save
        format.html { redirect_to admin_symptoms_path, notice: 'Symptom was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /symptoms/1
  # PATCH/PUT /symptoms/1.json
  def update
    respond_to do |format|
      if @symptom.update(symptom_params)
        format.html { redirect_to admin_symptoms_path, notice: 'Symptom was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /symptoms/1
  # DELETE /symptoms/1.json
  def destroy
    @symptom.destroy
    respond_to do |format|
      format.html { redirect_to admin_symptoms_path, notice: 'Symptom was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_symptom
      @symptom = Symptom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def symptom_params
      params.require(:symptom).permit(:title, :description, :age_min, :age_max, :gender, :position, :parent_id, :diagnosis_id)
    end
end
