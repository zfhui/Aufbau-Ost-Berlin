class ToursController < ApplicationController
  before_action :find_tour, only: :show

  def index
    @tours_page = Contentful::ToursPage.first
    @intro      = @tours_page.intro
    @outro      = @tours_page.outro
    @tours      = @tours_page.tours
  end

  def show
    @buildings = @tour.buildings
    @hash = build_markers
  end

  private

  def find_tour
    @tour ||= Contentful::Tour.find(params[:id])
  end

  def build_markers
    Gmaps4rails.build_markers @buildings do |building, marker|
     tour_building = Contentful::Building.find(building.id)

     marker.json ({id: tour_building.id, name: tour_building.name, tour_position: nil})
     marker.lat tour_building.latitude
     marker.lng tour_building.longitude
     marker.infowindow render_to_string(partial: "/buildings/infowindow", locals: { building: tour_building })
   end
 end
end
