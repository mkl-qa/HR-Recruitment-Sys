class RequisitionsController < ApplicationController
  before_action :set_requisition, only: [:show, :edit, :update, :destroy]
  
  def index
    @requisitions=Requisition.all
  end
  def new
    @requisition=Requisition.new
  end
  
  def show
  end
  
  def edit
  end
  
  def clone
    @requisition_temp1 = Requisition.find(params[:id])
    
    @requisition_temp2 = Requisition.order("Req_NO DESC").first
    @requisition_new_ReqID = Integer(@requisition_temp2.Req_ID)+1
    
    @requisition=Requisition.new(:Req_ID =>@requisition_new_ReqID, :Req_NO =>@requisition_temp1.Req_NO, :Position_title =>@requisition_temp1.Position_title, 
                                 :priority =>@requisition_temp1.priority, :job_category =>@requisition_temp1.job_category, :OG => @requisition_temp1.OG,
                                 :Position_Level =>@requisition_temp1.Position_Level, :Location =>@requisition_temp1.Location, :Openings =>@requisition_temp1.Openings,
                                 :Account_information=>@requisition_temp1.Account_information, :hiring_mgr=>@requisition_temp1.hiring_mgr, :job_posting_date => @requisition_temp1.job_posting_date,
                                 :approved_in_RMO_or_Not=>@requisition_temp1.approved_in_RMO_or_Not,:RMO_Open_Date=>@requisition_temp1.RMO_Open_Date,
                                 :preferred_onboard_date=>@requisition_temp1.preferred_onboard_date, :Biz_impact_details=>@requisition_temp1.Biz_impact_details,
                                 :key_words=>@requisition_temp1.key_words, :cahnnel=>@requisition_temp1.cahnnel, :status=>@requisition_temp1.status, :open_to_candidate=>@requisition_temp1.open_to_candidate,
                                 :job_description=>@requisition_temp1.job_description, :desired_skills_and_experience=>@requisition_temp1.desired_skills_and_experience)
  end
  
  
  
  def create
    @requisition = Requisition.new(requisition_params)

    respond_to do |format|
      if @requisition.save
        format.html { redirect_to @requisition, notice: 'Requisition was successfully created.' }
        format.json { render :show, status: :created, location: @requisition }
      else
        format.html { render :new }
        format.json { render json: @requisition.errors, status: :unprocessable_entity }
      end
    end
   end
   
   
   def update
     respond_to do |format|
      if @requisition.update(requisition_params)
        format.html { redirect_to @requisition, notice: 'Requisition was successfully updated.' }
        format.json { render :show, status: :ok, location: @requisition }
      else
        format.html { render :edit }
        format.json { render json: @requisition.errors, status: :unprocessable_entity }
      end
     end
   end
   
   def destroy
    @requisition.destroy
    respond_to do |format|
      format.html { redirect_to requisitions_url, notice: 'Requisition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
   
   
   private
    # Use callbacks to share common setup or constraints between actions.
    def set_requisition
      @requisition = Requisition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requisition_params
      params.require(:requisition).permit(:Req_ID, :Req_NO, :Position_title, :priority, :job_category, :OG, :Position_Level, :Location, :Openings, :Account_information, :hiring_mgr, :job_posting_date, 
                                          :approved_in_RMO_or_Not, :RMO_Open_Date, :preferred_onboard_date, :Biz_impact_details, :key_words, :cahnnel, :status, :open_to_candidate, :job_description, :desired_skills_and_experience)
    end
   
end
