class MerkleUsersController < ApplicationController
  before_action :set_merkle_user, only: [:show, :edit, :update, :destroy]

  # GET /merkle_users
  # GET /merkle_users.json
  def index
    @merkle_users = MerkleUser.all
    @datatext1 = params[:text1]
  end

  # GET /merkle_users/1
  # GET /merkle_users/1.json
  def show
  end

  # GET /merkle_users/new
  def new
    @merkle_user = MerkleUser.new
  end

  # GET /merkle_users/1/edit
  def edit
  end

  # POST /merkle_users
  # POST /merkle_users.json
  def create
    @merkle_user = MerkleUser.new(merkle_user_params)

    respond_to do |format|
      if @merkle_user.save
        format.html { redirect_to @merkle_user, notice: 'Merkle user was successfully created.' }
        format.json { render :show, status: :created, location: @merkle_user }
      else
        format.html { render :new }
        format.json { render json: @merkle_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merkle_users/1
  # PATCH/PUT /merkle_users/1.json
  def update
    respond_to do |format|
      if @merkle_user.update(merkle_user_params)
        format.html { redirect_to @merkle_user, notice: 'Merkle user was successfully updated.' }
        format.json { render :show, status: :ok, location: @merkle_user }
      else
        format.html { render :edit }
        format.json { render json: @merkle_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merkle_users/1
  # DELETE /merkle_users/1.json
  def destroy
    @merkle_user.destroy
    respond_to do |format|
      format.html { redirect_to merkle_users_url, notice: 'Merkle user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merkle_user
      @merkle_user = MerkleUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merkle_user_params
      params.require(:merkle_user).permit(:user_name, :user_psd, :eng_name, :chn_name, :email, :bu, :location, :mgr, :position_title, :user_role)
    end
end
