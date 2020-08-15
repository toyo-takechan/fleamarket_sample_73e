class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_creditcard, only: [:show]

  def index
  end

  def new
    @card = CreditCard.new
    # card = Card.where(user: current_user).first
    # redirect_to action: :index if card.present?
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: :new
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token'],
      )
      @card = CreditCard.new(user: current_user, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: :index
      else
        redirect_to action: :new
      end
    end
  end

  def show
    Payjp.api_key = Rails.application.secrets.payjp_access_key
    # customer = Payjp::Customer.retrieve(@creditcard.customer_id)
    # @creditcard_information = customer.cards.retrieve(@creditcard.card_id)
    @card_brand = @creditcard_information.brand 
    case @card_brand
    when "Visa"
      @card_src = "visa.svg"
    when "JCB"
      @card_src = "jcb.svg"
    when "MasterCard"
      @card_src = "master-card.svg"
    when "American Express"
      @card_src = "american_express.svg"
    when "Diners Club"
      @card_src = "dinersclub.svg"
    when "Discover"
      @card_src = "discover.svg"
    end
  end

  def destroy
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy
      redirect_to action: :new, notice: "削除しました"
    else
      redirect_to action: :index, alert: "削除できませんでした"
    end
  end

  # def index
  #   if @card.present?
  #     customer = Payjp::Customer.retrieve(@card.customer_id)
  #     @card_information = customer.cards.retrieve(@card.card_id)

  #     @card_brand = @card_information.brand
  #     case @card_brand
  #     when "Visa"
  #       @card_src = "visa.gif"
  #     when "JCB"
  #       @card_src = "jcb.gif"
  #     when "MasterCard"
  #       @card_src = "master.gif"
  #     when "American Express"
  #       @card_src = "amex.gif"
  #     when "Diners Club"
  #       @card_src = "diner.gif"
  #     when "Discover"
  #       @card_src = "discover.gif"
  #     end
  #   end
  # end

  # 機能追加時に使用
  # def destroy #PayjpとCardのデータベースを削除
  #   Payjp.api_key = "秘密鍵"
  #   customer = Payjp::Customer.retrieve(@card.customer_id)
  #   customer.delete
  #   if @card.destroy #削除に成功した時にポップアップを表示します。
  #     redirect_to action: "index", notice: "削除しました"
  #   else #削除に失敗した時にアラートを表示します。
  #     redirect_to action: "index", alert: "削除できませんでした"
  #   end
  # end

  private

  def set_creditcard
    @creditcard = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end

end
