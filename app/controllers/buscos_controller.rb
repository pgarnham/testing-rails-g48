class BuscosController < ApplicationController
  before_action :set_busco, only: [:show, :edit, :update, :destroy]

  # GET /buscos
  # GET /buscos.json
  def index
    @buscos = Busco.all
  end

  # GET /buscos/1
  # GET /buscos/1.json
  def show
  end

  # GET /buscos/new
  def new
    @busco = Busco.new
  end

  # GET /buscos/1/edit
  def edit
  end

  # POST /buscos
  # POST /buscos.json
  def create
    @busco = Busco.new(busco_params)

    respond_to do |format|
      if @busco.save
        format.html { redirect_to @busco, notice: 'Busco was successfully created.' }
        format.json { render :show, status: :created, location: @busco }
      else
        format.html { render :new }
        format.json { render json: @busco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buscos/1
  # PATCH/PUT /buscos/1.json
  def update
    respond_to do |format|
      if @busco.update(busco_params)
        format.html { redirect_to @busco, notice: 'Busco was successfully updated.' }
        format.json { render :show, status: :ok, location: @busco }
      else
        format.html { render :edit }
        format.json { render json: @busco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buscos/1
  # DELETE /buscos/1.json
  def destroy
    @busco.destroy
    respond_to do |format|
      format.html { redirect_to buscos_url, notice: 'Busco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_busco
      @busco = Busco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def busco_params
      params.require(:busco).permit(:course, :start, :finish)
    end
end
