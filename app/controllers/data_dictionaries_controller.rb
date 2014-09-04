class DataDictionariesController < ApplicationController
  before_action :set_data_dictionary, only: [:show, :edit, :update, :destroy]

  # GET /data_dictionaries
  # GET /data_dictionaries.json
  def index
    @dict_id = params[:dictid]
    set_parent_id(params[:dictid])
    @dict_name = params[:dictname]
    @data_dictionaries = DataDictionary.where( "id > ? AND parent_code = ? AND del_flg = ?", "999", get_parent_id, 0)
    # @maxidrecord = @data_dictionaries.order("id desc").limit(1)
    # @maxidrecord.each do |data_dictionary|
      # set_max_id( data_dictionary.id)
    # end
  end

  # GET /data_dictionaries/1
  # GET /data_dictionaries/1.json
  def show
  end

  # GET /data_dictionaries/new
  def new
    @data_dictionary = DataDictionary.new
    
  end

  # GET /data_dictionaries/1/edit
  def edit
  end

  # POST /data_dictionaries
  # POST /data_dictionaries.json
  def create
    @data_dictionary = DataDictionary.new(data_dictionary_params)
     
    respond_to do |format|
      if @data_dictionary.save
  
        @data_dictionary.update_columns( :parent_code => get_parent_id, :del_flg => 0 )
        # @lastupdate = DataDictionary.find_by_sql( "select * from data_dictionaries where created_at = (select MAX(created_at) from data_dictionaries) limit 1" )
        
        # @lastupdate.each do |lastupd|
          # lastupd.update_columns( :parent_code => get_parent_id, :del_flg => 0 )
        # end
        # format.html { redirect_to :partial => "show", :object => @data_dictionary , notice: 'Data dictionary was successfully created.' }
        format.html { redirect_to @data_dictionary, notice: 'Data dictionary was successfully created.' }
        format.json { render :show, status: :created, location: @data_dictionary }
        
      else
        format.html { render :new }
        format.json { render json: @data_dictionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_dictionaries/1
  # PATCH/PUT /data_dictionaries/1.json
  def update
    respond_to do |format|
      if @data_dictionary.update(data_dictionary_params)
        format.html { redirect_to @data_dictionary, notice: 'Data dictionary was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_dictionary }
      else
        format.html { render :edit }
        format.json { render json: @data_dictionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_dictionaries/1
  # DELETE /data_dictionaries/1.json
  def destroy
    respond_to do |format|
      @data_dictionary.update_columns( :del_flg => 1)
      format.html { redirect_to data_dictionaries_path(:dictid => @data_dictionary.parent_code), notice: 'Data dictionary was successfully destroyed.' }
      format.json { head :no_content }
    end
   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_dictionary
      @data_dictionary = DataDictionary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_dictionary_params
      params.require(:data_dictionary).permit(:name, :description, :parent_code, :del_flg)
    end
end
