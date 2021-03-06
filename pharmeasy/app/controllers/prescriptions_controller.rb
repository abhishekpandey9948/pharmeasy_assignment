class PrescriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prescription, only: [:show, :edit, :update, :destroy]

  def new
    @prescription = Prescription.new
  end

  def edit
  end

  def create
    @prescription = Prescription.new(prescription_params)
    respond_to do |format|
      if @prescription.save
        format.html { redirect_to '/', notice: 'prescription was successfully created.' }
        format.json { render :show, status: :created, location: @prescription }
      else
        format.html { render :new }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prescriptions/1
  # PATCH/PUT /prescriptions/1.json
  def update
    respond_to do |format|
      if @prescription.update(prescription_params)
        format.html { redirect_to @prescription, notice: 'prescription was successfully updated.' }
        format.json { render :show, status: :ok, location: @prescription }
      else
        format.html { render :edit }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescriptions/1
  # DELETE /prescriptions/1.json
  def destroy
    @prescription.destroy
    respond_to do |format|
      format.html { redirect_to prescriptions_url, notice: 'prescription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_prescription
    @prescription = Prescription.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def prescription_params
    params.require(:prescription).permit(:name, :documents_attributes => [:id, :source, :file_name, :_destroy]).merge!({:user_id=>current_user.id})
  end
end