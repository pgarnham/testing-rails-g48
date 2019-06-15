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
    @cursitos = Course.all.map{ |c| [c.name, c.id]}
    @id_recibido = params[:room_id]
  end

  # GET /buscos/1/edit
  def edit
    @cursitos = Course.all.map{ |c| [c.name, c.id]}
  end

  # POST /buscos
  # POST /buscos.json
  def create
    @busco = Busco.new(busco_params)
    @busco.course_id = params[:course_id]

    respond_to do |format|
      if @busco.save
        @primero_buscando = RelacionBusco.new
        @primero_buscando.user_id = @busco.user_id
        @primero_buscando.busco_id = @busco.id
        @primero_buscando.save
        format.html { redirect_to eventos_path, notice: 'Busco was successfully created.' }
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
    @busco.course_id = params[:course_id]

    respond_to do |format|
      if @busco.update(busco_params)
        format.html { redirect_to eventos_path, notice: 'Busco was successfully updated.' }
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
      format.html { redirect_to eventos_path, notice: 'Busco was successfully destroyed.' }
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
      params.require(:busco).permit(:start, :finish, :course_id, :user_id, :room_id, :limit)
    end
end
