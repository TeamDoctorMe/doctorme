require 'admin/admin_controller.rb'
class Admin::ConsiderationsController < AdminController
  before_action :set_consideration, only: [:show, :edit, :update, :destroy]

  # GET /considerations
  # GET /considerations.json
  def index
    @considerations = Consideration.all
  end

  # GET /considerations/1
  # GET /considerations/1.json
  def show
  end

  # GET /considerations/new
  def new
    @consideration = Consideration.new
  end

  # GET /considerations/1/edit
  def edit
  end

  # POST /considerations
  # POST /considerations.json
  def create
    @consideration = Consideration.new(consideration_params)

    respond_to do |format|
      if @consideration.save
        format.html { redirect_to @consideration, notice: 'Consideration was successfully created.' }
        format.json { render :show, status: :created, location: @consideration }
      else
        format.html { render :new }
        format.json { render json: @consideration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /considerations/1
  # PATCH/PUT /considerations/1.json
  def update
    respond_to do |format|
      if @consideration.update(consideration_params)
        format.html { redirect_to @consideration, notice: 'Consideration was successfully updated.' }
        format.json { render :show, status: :ok, location: @consideration }
      else
        format.html { render :edit }
        format.json { render json: @consideration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /considerations/1
  # DELETE /considerations/1.json
  def destroy
    @consideration.destroy
    respond_to do |format|
      format.html { redirect_to considerations_url, notice: 'Consideration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consideration
      @consideration = Consideration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consideration_params
      params.require(:consideration).permit(:title, :exit, :age_min, :age_max, :gender)
    end
end
