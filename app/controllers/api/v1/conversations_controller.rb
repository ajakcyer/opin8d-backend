class Api::V1::ConversationsController < ApplicationController

    skip_before_action :authorized, only: [:index]

    def index
        conversations = Conversation.all

        render json: conversations
    end
    
    def create
        # byebug
        conversation = Conversation.create!()

        ownwer1 = UserConversation.create(conversation_id: conversation.id, user_id: params[:sender_id])
        ownwer2 = UserConversation.create(conversation_id: conversation.id, user_id: params[:receiver_id])
        # byebug

        serialized_data = ActiveModelSerializers::Adapter::Json.new(ConversationSerializer.new(conversation)).serializable_hash

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

    private

    def conversation_params
        params.permit(:sender_id, :receiver_id)
    end
end
