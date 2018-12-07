class Api::V1::MessagesController < ApplicationController
  before_action :find_message, only: [:update]

  def index
    @messages = Message.all
    render json: @messages
  end

  private

  def find_message
    @message = Message.find[:params[:id]]
  end
end
