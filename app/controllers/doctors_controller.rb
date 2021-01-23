class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      redirect_to doctors_path, notice: "Doctor profile successfully created!"
    else
      redirect_to doctors_path, alert: "Invalid input, Doctor profile creation failed..."
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])

    if @doctor.update(doctor_params)
      redirect_to @doctor, notice: "Doctor profile successfully updated!"
    else
      flash.now[:alert] = "Invalid input, Doctor profile update failed..."
      render :edit
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy

    redirect_to doctors_path, notice: "Doctor profile successfully deleted!"
  end

  private
  	def doctor_params
  	  params.require(:doctor).permit(:name, :specialty)
  	end
end
