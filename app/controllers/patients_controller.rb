class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to patients_path, notice: "Patient profile successfully created!"
    else
      redirect_to patients_path, alert: "Invalid input, patient profile creation failed..."
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to @patient, notice: "Patient profile successfully updated!"
    else
      flash.now[:alert] = "Invalid input, patient profile update failed..."
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    redirect_to patients_path, notice: "Patient profile successfully deleted!"
  end

  private
  	def patient_params
  	  params.require(:patient).permit(:name, :dob, :is_insured)
  	end
end
