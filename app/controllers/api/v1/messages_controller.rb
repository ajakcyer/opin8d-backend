class Api::V1::MessagesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    messages = Message.all
    render json: messages
  end

    def create
        message = Message.new(message_params)
        # byebug
        conversation = Conversation.find(params[:conversation_id])
        if message.save
          
        serialized_data = ActiveModelSerializers::Adapter::Json.new(ConversationSerializer.new(conversation)).serializable_hash
          # byebug
        ActionCable.server.broadcast(
            "current_user_#{current_user.id}",
            serialized_data
        )

        ActionCable.server.broadcast(
            "current_user_#{params["receiver_id"]}", 
            serialized_data
        )

        head :ok
        end

      end
      
      private
      
      def message_params
        params.permit(:text, :conversation_id, :user_id)
      end
end
