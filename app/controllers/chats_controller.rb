class ChatsController < ApplicationController

  def index
    @messages = Message.last(10)
  end

  def create
    if @message = Message.create(resource_params)
      PrivatePub.publish_to "/messages/new", :msg_body => render_to_string(partial: 'message', layout: false, locals: { message: @message })
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  def resource_params
    request.get? ? {} : params.require(:message).permit!
  end
end