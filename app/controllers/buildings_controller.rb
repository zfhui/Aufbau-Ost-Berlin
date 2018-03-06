class BuildingsController < ApplicationController
  include Gmaps4rails
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update, :destroy, :import]
  before_action :find_building, only: [:show, :edit, :update, :destroy]

  # GET /buildings
  # GET /buildings.json
  def index
    @buildings = Contentful::Building.all.load.sort_by(&:name)
    @tours     = Contentful::Tour.all.load.sort_by(&:name)

    @hash = Gmaps4rails.build_markers @buildings do |building, marker|
      marker.json (
        {
          id: building.id,
          name: building.name,
          tour_id: @tours.map(&:id).index(building.try(:tour).try(:id))
        }
      )
      marker.lat building.location['lat']
      marker.lng building.location['lon']
      marker.infowindow render_to_string(partial: '/buildings/infowindow', locals: { building: building })
    end
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
    @photos = @building.try(:gallery).try(:photos)
    @videos = @building.try(:videos)
  end

  # GET /buildings/new
  def new
    @building = Building.new
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: 'Building was successfully created.' }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: 'Building was successfully updated.' }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: 'Building was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Building.import(params[:file])
    redirect_to buildings_url, notice: 'Buildings imported.'
  end

  private

  def find_building
    id = params[:id]
    @building = Contentful::Building.find(id)
  end

  def building_params
    params
      .require(:building)
      .permit(
        :name,
        :latitude,
        :longitude,
        :architect,
        :architect_2,
        :architect_3,
        :built_from,
        :built_to,
        :built_from_2,
        :built_to_2,
        :description,
        :wiki_url,
        :wiki_common_url,
        :denkmalliste_url,
        :grossstadt_url,
        :other_url,
        :other_url_2,
        :comments,
        :tour_id,
        :video_url,
        :street_name,
        :house_no,
        :zipcode,
        :city,
        :tour_position,
        :video_description
      )
  end
end
