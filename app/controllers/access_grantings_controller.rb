class AccessGrantingsController < ApplicationController
  before_action :set_access_granting, only: [:show, :edit, :update, :destroy]

  # GET /access_grantings
  # GET /access_grantings.json
  def index
    @access_grantings = AccessGranting.all
  end

  # GET /access_grantings/1
  # GET /access_grantings/1.json
  def show
  end

  # GET /access_grantings/new
  def new
    @access_granting = AccessGranting.new
  end

  # GET /access_grantings/1/edit
  def edit
  end

  # POST /access_grantings
  # POST /access_grantings.json
  def create
    @access_granting = AccessGranting.new(access_granting_params)

    respond_to do |format|
      if @access_granting.save
        format.html { redirect_to @access_granting, notice: 'Access granting was successfully created.' }
        format.json { render :show, status: :created, location: @access_granting }
      else
        format.html { render :new }
        format.json { render json: @access_granting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /access_grantings/1
  # PATCH/PUT /access_grantings/1.json
  def update
    respond_to do |format|
      if @access_granting.update(access_granting_params)
        format.html { redirect_to @access_granting, notice: 'Access granting was successfully updated.' }
        format.json { render :show, status: :ok, location: @access_granting }
      else
        format.html { render :edit }
        format.json { render json: @access_granting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /access_grantings/1
  # DELETE /access_grantings/1.json
  def destroy
    @access_granting.destroy
    respond_to do |format|
      format.html { redirect_to access_grantings_url, notice: 'Access granting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_access_granting
      @access_granting = AccessGranting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def access_granting_params
      params.require(:access_granting).permit(:client_id, :library_access_id)
    end
end
