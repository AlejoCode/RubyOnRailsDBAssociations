class AttendancesController < ApplicationController
    before_action :logged_in_user, only: %i[new create edit]
  def index
    @attendances = Attendance.all
  end

  def create
    @attendance.attendee = current_user.name
    @attendance.event_id = current_user.event_id
    @attendance.user_id = current_user.id
    if @attendance.save
      redirect_to users_path
    else
      flash.now[:danger] = 'Attendance was not created'
      render 'new'
    end
  end
  
  def show; end

  private

  def set_attentance
    @attendance = Attendance.find(params[:attendee, :user_id, event_id])
  end
       
end
