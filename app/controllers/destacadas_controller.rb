class DestacadasController < ApplicationController
  before_action :set_destacada, only: [:show, :edit, :update, :destroy]

  # GET /destacadas
  # GET /destacadas.json
  def index
    @destacadas = Destacada.all
  end

  # GET /destacadas/1
  # GET /destacadas/1.json
  def show
  end

  # GET /destacadas/new
  def new
    @destacada = Destacada.new
  end

  # GET /destacadas/1/edit
  def edit
  end

  # POST /destacadas
  # POST /destacadas.json
  def create
    @destacada = Destacada.new(destacada_params)

    respond_to do |format|
      if @destacada.save
        format.html { redirect_to @destacada, notice: 'Destacada was successfully created.' }
        format.json { render :show, status: :created, location: @destacada }
      else
        format.html { render :new }
        format.json { render json: @destacada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destacadas/1
  # PATCH/PUT /destacadas/1.json
  def update
    respond_to do |format|
      if @destacada.update(destacada_params)
        format.html { redirect_to @destacada, notice: 'Destacada was successfully updated.' }
        format.json { render :show, status: :ok, location: @destacada }
      else
        format.html { render :edit }
        format.json { render json: @destacada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destacadas/1
  # DELETE /destacadas/1.json
  def destroy
    @destacada.destroy
    respond_to do |format|
      format.html { redirect_to destacadas_url, notice: 'Destacada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destacada
      @destacada = Destacada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def destacada_params
      params.require(:destacada).permit(:user_id, :post_id)
    end
end
