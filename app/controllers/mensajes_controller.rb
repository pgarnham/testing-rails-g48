class MensajesController < ApplicationController
  before_action :set_mensaje, only: [:show, :edit, :update, :destroy]

  # GET /mensajes
  # GET /mensajes.json
  def index
    @mensajes_recibidos = Mensaje.where(:receptor => current_user.id)
    @mensajes_enviados = Mensaje.where(:autor => current_user.id)
  end

  # GET /mensajes/1
  # GET /mensajes/1.json
  def show
  end

  # GET /mensajes/new
  def new
    @mensaje = Mensaje.new

    @set_contactos = Set.new
    Chat.all.each do |chat|
      if chat.primero == current_user.id
        @set_contactos << chat.segundo
      elsif chat.segundo == current_user.id
        @set_contactos << chat.primero
      end
    end

    @set_contactos << current_user.id
    @todos_menos_yo = []
    User.all.each do |usuario|
      if @set_contactos.exclude?(usuario.id)
        @todos_menos_yo << usuario
      end
    end
    @usuarios = @todos_menos_yo.map{ |c| [c.name + " " + c.last_name, c.id]}
  end

  # GET /mensajes/1/edit
  def edit
    @todos_menos_yo = User.where.not(:id => current_user.id)
    @usuarios = @todos_menos_yo.map{ |c| [c.name + " " + c.last_name, c.id]}
  end

  # POST /mensajes
  # POST /mensajes.json
  def create
    @mensaje = Mensaje.new(mensaje_params)
    @mensaje.receptor = params[:receptor]
    respond_to do |format|
      if @mensaje.save
        if @mensaje.existe == 1
          format.html { redirect_to Chat.find(@mensaje.chat_id), notice: 'Mensaje was successfully created.' }
          format.json { render :show, status: :created, location: @mensaje }
        else
          @nuevo_chat = Chat.new
          @nuevo_chat.primero = current_user.id
          @nuevo_chat.segundo = @mensaje.receptor
          @nuevo_chat.save
          @mensaje.chat_id = @nuevo_chat.id
          @mensaje.save
          format.html { redirect_to @nuevo_chat, notice: 'Mensaje was successfully created.' }
          format.json { render :show, status: :created, location: @mensaje }
        end
      else
        format.html { render :new }
        format.json { render json: @mensaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mensajes/1
  # PATCH/PUT /mensajes/1.json
  def update
    @mensaje.receptor = params[:receptor]
    respond_to do |format|
      if @mensaje.update(mensaje_params)
        format.html { redirect_to @mensaje, notice: 'Mensaje was successfully updated.' }
        format.json { render :show, status: :ok, location: @mensaje }
      else
        format.html { render :edit }
        format.json { render json: @mensaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensajes/1
  # DELETE /mensajes/1.json
  def destroy
    @mensaje.destroy
    respond_to do |format|
      format.html { redirect_to mensajes_url, notice: 'Mensaje was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensaje
      @mensaje = Mensaje.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mensaje_params
      params.require(:mensaje).permit(:autor, :receptor, :contenido, :titulo, :chat_id, :existe)
    end
end
