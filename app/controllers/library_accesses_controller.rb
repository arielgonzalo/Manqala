class LibraryAccessesController < ApplicationController
  before_action :set_library_access, only: [:show, :edit, :update, :destroy]

  # GET /library_accesses
  # GET /library_accesses.json
  def index
    @library_accesses = LibraryAccess.all
  end

  # GET /library_accesses/1
  # GET /library_accesses/1.json
  def show
  end

  # GET /library_accesses/new
  def new
    @library_access = LibraryAccess.new
  end

  # GET /library_accesses/1/edit
  def edit
  end

  # POST /library_accesses
  # POST /library_accesses.json
  def create
    @library_access = LibraryAccess.new(library_access_params)

    respond_to do |format|
      if @library_access.save
        format.html { redirect_to @library_access, notice: 'Library access was successfully created.' }
        format.json { render :show, status: :created, location: @library_access }
      else
        format.html { render :new }
        format.json { render json: @library_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /library_accesses/1
  # PATCH/PUT /library_accesses/1.json
  def update
    respond_to do |format|
      if @library_access.update(library_access_params)
        format.html { redirect_to @library_access, notice: 'Library access was successfully updated.' }
        format.json { render :show, status: :ok, location: @library_access }
      else
        format.html { render :edit }
        format.json { render json: @library_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /library_accesses/1
  # DELETE /library_accesses/1.json
  def destroy
    @library_access.destroy
    respond_to do |format|
      format.html { redirect_to library_accesses_url, notice: 'Library access was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library_access
      @library_access = LibraryAccess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def library_access_params
      params.require(:library_access).permit(:start_time, :end_time)
    end
end
