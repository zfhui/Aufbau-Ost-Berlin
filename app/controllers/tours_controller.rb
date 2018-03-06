class ToursController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  # GET /tours
  # GET /tours.json
  def index
    @tours_page = Contentful::ToursPage.first
    @intro      = @tours_page.intro
    @outro      = @tours_page.outro
    @tours      = @tours_page.tours
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
    @buildings = @tour.buildings.reorder(:tour_position)
    @hash = Gmaps4rails.build_markers @buildings do |building, marker|
      marker.json ({id: building.id, name: building.name, tour_position: building.tour_position})
      marker.lat building.latitude
      marker.lng building.longitude
      marker.infowindow render_to_string(partial: "/buildings/infowindow", locals: {object: building})
    end
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params
        .require(:tour)
        .permit(
          :name,
          :description,
          :image_path,
          :comments
        )
    end
end
