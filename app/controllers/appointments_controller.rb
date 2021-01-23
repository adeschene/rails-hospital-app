class AppointmentsController < ApplicationController
  def index
  	@appointments = Appointment.all
  end

  def show
  	@appointment = Appointment.find(params[:id])
  end

  def create
  	@appointment = Appointment.new(appointment_params)

  	if @appointment.save
  	  redirect_to root_path, notice: "Appointment successfully scheduled!"
  	else
  	  redirect_to root_path, alert: "Invalid input, appointment scheduling failed..."
  	end
  end

  def edit
  	@appointment = Appointment.find(params[:id])
  end

  def update
  	@appointment = Appointment.find(params[:id])

  	if @appointment.update(appointment_params)
  	  redirect_to @appointment, notice: "Appointment successfully updated!"
  	else
  	  flash.now[:alert] = "Invalid input, appointment update failed..."
      render :edit
    end
  end

  def destroy
  	@appointment = Appointment.find(params[:id])
  	@appointment.destroy

  	redirect_to root_path, notice: "Appointment successfully deleted!"
  end

  private
  	def appointment_params
  	  params.require(:appointment).permit(:issue, :date, :start_time, :end_time, :patient_id, :doctor_id)
  	end
end
