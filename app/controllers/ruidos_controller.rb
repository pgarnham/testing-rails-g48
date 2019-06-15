class RuidosController < ApplicationController
  before_action :set_ruido, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  # GET /ruidos
  # GET /ruidos.json
  def index
    @ruidos = Ruido.all
  end

  # GET /ruidos/1
  # GET /ruidos/1.json
  def show
  end

  # GET /ruidos/new
  def new
    @ruido = Ruido.new
  end

  # GET /ruidos/1/edit
  def edit
  end

  # POST /ruidos
  # POST /ruidos.json
  def create
    @ruido = Ruido.new(ruido_params)

    respond_to do |format|
      if @ruido.save
        format.html { redirect_to @ruido, notice: 'Ruido was successfully created.' }
        format.json { render :show, status: :created, location: @ruido }
      else
        format.html { render :new }
        format.json { render json: @ruido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ruidos/1
  # PATCH/PUT /ruidos/1.json
  def update
    respond_to do |format|
      if @ruido.update(ruido_params)
        format.html { redirect_to @ruido, notice: 'Ruido was successfully updated.' }
        format.json { render :show, status: :ok, location: @ruido }
      else
        format.html { render :edit }
        format.json { render json: @ruido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ruidos/1
  # DELETE /ruidos/1.json
  def destroy
    @ruido.destroy
    respond_to do |format|
      format.html { redirect_to ruidos_url, notice: 'Ruido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @ruido.upvote_from current_user
    @sala_tres = Room.find(@ruido.room_id)
    @sala_tres.noise = @ruido.get_upvotes.size - @ruido.get_downvotes.size
    @sala_tres.save
    redirect_to @sala_tres
  end

  def downvote
    @ruido.downvote_from current_user
    @sala_tres = Room.find(@ruido.room_id)
    @sala_tres.noise = @ruido.get_upvotes.size - @ruido.get_downvotes.size
    @sala_tres.save
    redirect_to @sala_tres
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ruido
      @ruido = Ruido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ruido_params
      params.require(:ruido).permit(:room_id)
    end
end
