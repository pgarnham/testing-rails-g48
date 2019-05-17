class OfrezcosController < ApplicationController
  before_action :set_ofrezco, only: [:show, :edit, :update, :destroy]

  # GET /ofrezcos
  # GET /ofrezcos.json
  def index
    @ofrezcos = Ofrezco.all
  end

  # GET /ofrezcos/1
  # GET /ofrezcos/1.json
  def show
  end

  # GET /ofrezcos/new
  def new
    @ofrezco = Ofrezco.new
  end

  # GET /ofrezcos/1/edit
  def edit
  end

  # POST /ofrezcos
  # POST /ofrezcos.json
  def create
    @ofrezco = Ofrezco.new(ofrezco_params)

    respond_to do |format|
      if @ofrezco.save
        format.html { redirect_to @ofrezco, notice: 'Ofrezco was successfully created.' }
        format.json { render :show, status: :created, location: @ofrezco }
      else
        format.html { render :new }
        format.json { render json: @ofrezco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ofrezcos/1
  # PATCH/PUT /ofrezcos/1.json
  def update
    respond_to do |format|
      if @ofrezco.update(ofrezco_params)
        format.html { redirect_to @ofrezco, notice: 'Ofrezco was successfully updated.' }
        format.json { render :show, status: :ok, location: @ofrezco }
      else
        format.html { render :edit }
        format.json { render json: @ofrezco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ofrezcos/1
  # DELETE /ofrezcos/1.json
  def destroy
    @ofrezco.destroy
    respond_to do |format|
      format.html { redirect_to ofrezcos_url, notice: 'Ofrezco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ofrezco
      @ofrezco = Ofrezco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ofrezco_params
      params.require(:ofrezco).permit(:course, :start, :finish, :user_id)
    end
end
