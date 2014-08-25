class JobappsController < ApplicationController
  # load_and_authorize_resource except: [:create]
 
  # GET /jobapps
  # GET /jobapps.json
  def index
    @jobapps = Jobapp.all
  end

  # GET /jobapps/1
  # GET /jobapps/1.json
  def show
    @jobapp = Jobapp.find(params[:id])
  end

  # GET /jobapps/new
  def new
    @jobapp = Jobapp.new
  end

  # GET /jobapps/1/edit
  def edit
    @jobapp = Jobapp.find(params[:id])
  end

  # POST /jobapps
  # POST /jobapps.json
  def create
    @jobapp = Jobapp.new(jobapp_params)

      if @jobapp.save
        flash[:success] = "A new job is created."
        redirect_to @jobapp
      else
        render :new
      end
  end

  # PATCH/PUT /jobapps/1
  # PATCH/PUT /jobapps/1.json
  def update
      if @jobapp.update(jobapp_params)
        flash[:success] = "Jobapp was successfully updated."
        redirect_to @jobapp
      else
        render :edit
      end
  end

  # DELETE /jobapps/1
  # DELETE /jobapps/1.json
  def destroy
    @jobapp.destroy
    respond_to do |format|
      format.html { redirect_to jobapps_url, notice: 'Jobapp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobapp
      @jobapp = Jobapp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobapp_params
      params.require(:jobapp).permit(:title, :dept, :num, :description, :requirement)
    end
end
