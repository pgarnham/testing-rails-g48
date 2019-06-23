class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @mi_ev_ruido = Ruido.find_by(:room_id => @room.id)
    @mi_ev_disp = Disponibilidad.find_by(:room_id => @room.id)
    @mi_ev_enchufe = Enchufe.find_by(:room_id => @room.id)
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @campuses = Campu.all.map{ |c| [c.name, c.id]}
  end

  # GET /rooms/1/edit
  def edit
    @campuses = Campu.all.map{ |c| [c.name, c.id]}
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    @room.campu_id = params[:campu_id]

    respond_to do |format|
      if @room.save
        @evaluacion_en = Enchufe.new
        @evaluacion_en.room_id = @room.id
        @evaluacion_en.save

        @evaluacion_ruido = Ruido.new
        @evaluacion_ruido.room_id = @room.id
        @evaluacion_ruido.save

        @evaluacion_disp = Disponibilidad.new
        @evaluacion_disp.room_id = @room.id
        @evaluacion_disp.save
        format.html { redirect_to rooms_path, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    @room.campu_id = params[:campu_id]
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :location, :disponibility, :noise, :plugs, :campu_id)
    end
end
