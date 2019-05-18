class RegistradosController < ApplicationController
  before_action :set_registrado, only: [:show, :edit, :update, :destroy]

  # GET /registrados
  # GET /registrados.json
  def index
    @registrados = Registrado.all
  end

  # GET /registrados/1
  # GET /registrados/1.json
  def show
  end

  # GET /registrados/new
  def new
    @registrado = Registrado.new
  end

  # GET /registrados/1/edit
  def edit
  end

  # POST /registrados
  # POST /registrados.json
  def create
    @registrado = Registrado.new(registrado_params)

    respond_to do |format|
      if @registrado.save
        format.html { redirect_to @registrado, notice: 'Registrado was successfully created.' }
        format.json { render :show, status: :created, location: @registrado }
      else
        format.html { render :new }
        format.json { render json: @registrado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrados/1
  # PATCH/PUT /registrados/1.json
  def update
    respond_to do |format|
      if @registrado.update(registrado_params)
        format.html { redirect_to @registrado, notice: 'Registrado was successfully updated.' }
        format.json { render :show, status: :ok, location: @registrado }
      else
        format.html { render :edit }
        format.json { render json: @registrado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrados/1
  # DELETE /registrados/1.json
  def destroy
    @registrado.destroy
    respond_to do |format|
      format.html { redirect_to registrados_url, notice: 'Registrado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registrado
      @registrado = Registrado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registrado_params
      params.fetch(:registrado, {})
    end
end
