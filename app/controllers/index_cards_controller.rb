class IndexCardsController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :set_index_card, only: [:show, :edit, :update, :destroy]

  # GET /index_cards
  # GET /index_cards.json
  def index
    @index_cards = IndexCard.all.page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /index_cards/1
  # GET /index_cards/1.json
  def show
  end

  # GET /index_cards/new
  def new
    @index_card = IndexCard.new
  end

  # GET /index_cards/1/edit
  def edit
  end

  # POST /index_cards
  # POST /index_cards.json
  def create
    @index_card = IndexCard.new(index_card_params)

    respond_to do |format|
      if @index_card.save
        format.html { redirect_to @index_card, notice: 'Index card was successfully created.' }
        format.json { render :show, status: :created, location: @index_card }
      else
        format.html { render :new }
        format.json { render json: @index_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /index_cards/1
  # PATCH/PUT /index_cards/1.json
  def update
    respond_to do |format|
      if @index_card.update(index_card_params)
        format.html { redirect_to @index_card, notice: 'Index card was successfully updated.' }
        format.json { render :show, status: :ok, location: @index_card }
      else
        format.html { render :edit }
        format.json { render json: @index_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /index_cards/1
  # DELETE /index_cards/1.json
  def destroy
    @index_card.destroy
    respond_to do |format|
      format.html { redirect_to index_cards_url, notice: 'Index card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    IndexCard.import(params[:file])
    redirect_to index_cards_url, notice: 'Karteikarte importiert.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_index_card
    @index_card = IndexCard.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def index_card_params
    params
      .require(:index_card)
      .permit(
        :photographer,
        :architect,
        :building_name,
        :place,
        :systematic,
        :ownership,
        :filename,
        :no_of_photos,
        :inventory_date,
        :creditline,
        :content,
        :year_taken,
        :original_filename,
        :flickr_id,
        :url_t,
        :url_s,
        :url_sq,
        :url_m,
        :url_o,
        :pathalias,
        :title
      )
  end
end
