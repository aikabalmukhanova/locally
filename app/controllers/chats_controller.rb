class ChatsController < ApplicationController
  def index
    @chats = current_user.chats
  end

  def show
    @chat = Chat.find(params[:id])
    if @chat.user != current_user
      redirect_to locallers_path, notice: "You don't have access to this chat"
    end
    @message = Message.new
  end

  def create
    @chat = Chat.create(user: current_user, localler_id: params[:localler])
    redirect_to chat_path(@chat)
  end
end
