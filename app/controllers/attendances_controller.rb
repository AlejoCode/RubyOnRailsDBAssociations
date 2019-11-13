class AttendancesController < ApplicationController
  before_action :logged_in_user, only: %i[new create]
  def index
    @attendances = Attendance.all
  end

  def new
    @attendance = Attendance.new(params[:event_id])
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.attendee = current_user.name
    # @attendance.event_id = current_user.event_id
    @attendance.user_id = current_user.id
    if @attendance.save
      redirect_to attendances_path
    else
      flash.now[:danger] = 'Attendance was not created'
      render 'index'
    end
  end

  private

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.permit(:event_id)
  end
end
