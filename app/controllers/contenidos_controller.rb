class ContenidosController < ApplicationController
  before_action :set_contenido, only: [:show, :edit, :update, :destroy]

  # GET /contenidos
  # GET /contenidos.json
  def index
    @admin = Administrador.new
    @contenidos = Contenido.all
    @solicitud_moderador = SolModerador.new
    @solicitud_administrador = SolAdmin.new
     #es solo auxiliar
  end

  # GET /contenidos/1
  # GET /contenidos/1.json
  def show
  end

  # GET /contenidos/new
  def new
    @contenido = Contenido.new
  end

  # GET /contenidos/1/edit
  def edit
  end

  # POST /contenidos
  # POST /contenidos.json
  def create
    @contenido = Contenido.new(contenido_params)

    respond_to do |format|
      if @contenido.save
        format.html { redirect_to @contenido, notice: 'Contenido was successfully created.' }
        format.json { render :show, status: :created, location: @contenido }
      else
        format.html { render :new }
        format.json { render json: @contenido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contenidos/1
  # PATCH/PUT /contenidos/1.json
  def update
    respond_to do |format|
      if @contenido.update(contenido_params)
        format.html { redirect_to @contenido, notice: 'Contenido was successfully updated.' }
        format.json { render :show, status: :ok, location: @contenido }
      else
        format.html { render :edit }
        format.json { render json: @contenido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contenidos/1
  # DELETE /contenidos/1.json
  def destroy
    @contenido.destroy
    respond_to do |format|
      format.html { redirect_to contenidos_url, notice: 'Contenido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contenido
      @contenido = Contenido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contenido_params
      params.fetch(:contenido, {})
    end
end
