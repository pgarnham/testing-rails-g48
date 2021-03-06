class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]

  # GET /chats
  # GET /chats.json
  def index
    @chats = Chat.all
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

  # GET /chats/1
  # GET /chats/1.json
  def show
    @nuevo_mensaje = Mensaje.new
    @mensajes_del_chat = Mensaje.where(chat_id: @chat.id)
    if @chat.primero == current_user.id
      @amigo = @chat.segundo
    else
      @amigo = @chat.primero
    end
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats
  # POST /chats.json
  def create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save
        format.html { redirect_to @chat, notice: 'Chat was successfully created.' }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1
  # PATCH/PUT /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to chats_url, notice: 'Chat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_params
      params.require(:chat).permit(:primero, :segundo)
    end
end
