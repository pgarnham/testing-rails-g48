class RelacionBuscosController < ApplicationController
  before_action :set_relacion_busco, only: [:show, :edit, :update, :destroy]

  # GET /relacion_buscos
  # GET /relacion_buscos.json
  def index
    @relacion_buscos = RelacionBusco.all
  end

  # GET /relacion_buscos/1
  # GET /relacion_buscos/1.json
  def show
  end

  # GET /relacion_buscos/new
  def new
    @relacion_busco = RelacionBusco.new
    @grupo_r = params[:grupo_actual]
  end

  # GET /relacion_buscos/1/edit
  def edit
  end

  # POST /relacion_buscos
  # POST /relacion_buscos.json
  def create
    @relacion_busco = RelacionBusco.new(relacion_busco_params)

    respond_to do |format|
      if @relacion_busco.save
        format.html { redirect_to @relacion_busco, notice: 'Relacion busco was successfully created.' }
        format.json { render :show, status: :created, location: @relacion_busco }
      else
        format.html { render :new }
        format.json { render json: @relacion_busco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relacion_buscos/1
  # PATCH/PUT /relacion_buscos/1.json
  def update
    respond_to do |format|
      if @relacion_busco.update(relacion_busco_params)
        format.html { redirect_to @relacion_busco, notice: 'Relacion busco was successfully updated.' }
        format.json { render :show, status: :ok, location: @relacion_busco }
      else
        format.html { render :edit }
        format.json { render json: @relacion_busco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relacion_buscos/1
  # DELETE /relacion_buscos/1.json
  def destroy
    @relacion_busco.destroy
    respond_to do |format|
      format.html { redirect_to relacion_buscos_url, notice: 'Relacion busco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relacion_busco
      @relacion_busco = RelacionBusco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relacion_busco_params
      params.require(:relacion_busco).permit(:user_id, :busco_id)
    end
end
