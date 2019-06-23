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
    @ofrezco = current_user.ofrezcos.build

    @soy_profe = Profesor.where(user_id: current_user.id)
    @mis_cursitos = []
    @soy_profe.each do |prof|
      @mis_cursitos << Course.find(prof.course_id)
    end

    @cursitos = @mis_cursitos.map{ |c| [c.name, c.id]}
    @id_recibido = params[:room_id]
  end

  # GET /ofrezcos/1/edit
  def edit
    @cursitos = Course.all.map{ |c| [c.name, c.id]}
  end

  # POST /ofrezcos
  # POST /ofrezcos.json
  def create
    @ofrezco = current_user.ofrezcos.build(ofrezco_params)
    @ofrezco.course_id = params[:course_id]
    respond_to do |format|
      if @ofrezco.save
        format.html { redirect_to eventos_path, notice: 'Ofrezco was successfully created.' }
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
    @ofrezco.course_id = params[:course_id]
    respond_to do |format|
      if @ofrezco.update(ofrezco_params)
        format.html { redirect_to eventos_path, notice: 'Ofrezco was successfully updated.' }
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
      format.html { redirect_to eventos_path, notice: 'Ofrezco was successfully destroyed.' }
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
      params.require(:ofrezco).permit(:start, :finish, :user_id, :course_id, :room_id)
    end
end
