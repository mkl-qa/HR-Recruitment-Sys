class JobPositionsController < ApplicationController
  before_action :is_recruiter?, only: [:new, :create, :destroy]

  def job_params
    params.require(:job_position).permit(:title, :dept, :opennum, :description, :requirement)
  end
  
  def show
    @job = JobPosition.find(params[:id])
  end
  def create
    @job = JobPosition.new(job_params)
    if @job.save
      flash[:success] = "A new job is created."
      redirect_to @job
    end
  end

  def new
    if is_recruiter?
      @job = JobPosition.new
    else
      if signed_in?
        redirect_to current_user
      else
        redirect_to signin_url
      end
    end
  end
  
  def destroy
  end
end
