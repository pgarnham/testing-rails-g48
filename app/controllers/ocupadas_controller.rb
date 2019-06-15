class OcupadasController < ApplicationController
  before_action :set_ocupada, only: [:show, :edit, :update, :destroy]

  # GET /ocupadas
  # GET /ocupadas.json
  def index
    @ocupadas = Ocupada.all
  end

  # GET /ocupadas/1
  # GET /ocupadas/1.json
  def show
  end

  # GET /ocupadas/new
  def new
    @ocupada = Ocupada.new
    @id_recibido = params[:room_id]
  end

  # GET /ocupadas/1/edit
  def edit
  end

  # POST /ocupadas
  # POST /ocupadas.json
  def create
    @ocupada = Ocupada.new(ocupada_params)

    respond_to do |format|
      if @ocupada.save
        format.html { redirect_to eventos_path , notice: 'Ocupada was successfully created.' }
        format.json { render :show, status: :created, location: @ocupada }
      else
        format.html { render :new }
        format.json { render json: @ocupada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ocupadas/1
  # PATCH/PUT /ocupadas/1.json
  def update
    respond_to do |format|
      if @ocupada.update(ocupada_params)
        format.html { redirect_to eventos_path, notice: 'Ocupada was successfully updated.' }
        format.json { render :show, status: :ok, location: @ocupada }
      else
        format.html { render :edit }
        format.json { render json: @ocupada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ocupadas/1
  # DELETE /ocupadas/1.json
  def destroy
    @ocupada.destroy
    respond_to do |format|
      format.html { redirect_to eventos_path, notice: 'Ocupada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ocupada
      @ocupada = Ocupada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ocupada_params
      params.require(:ocupada).permit(:description, :start, :finish, :room_id, :user_id)
    end
end
