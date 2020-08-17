class CardsController < ApplicationController

  before_action :move_to_root 
  before_action :set_card,    only: [:new, :show, :destroy, :buy, :pay]
  # before_action :set_item,    only: [:buy, :pay]
  require "payjp"

  def new
    redirect_to card_path(current_user.id) if @card.present?
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
    if params['payjp-token'].blank?
      redirect_to new_card_path
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
    end
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_path
      else
        redirect_to new_card_path
      end
  end

  def show
  end
  
  def index
  end

  private
  def move_to_root
    redirect_to root_path unless user_signed_in?
  end

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end
  
end

