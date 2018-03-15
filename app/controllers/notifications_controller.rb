# encoding: utf-8

class NotificationsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:mark_as_read]

  def index
    @notifications = Notification.where(recipient: current_user).includes(:notifiable, :actor).recent
    render layout: false
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update(read_at: Time.zone.now)
    render json: { success: true }
  end
end
