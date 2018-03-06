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
    @hash = Gmaps4rails.build_markers @buildings do |building, marker|
      marker.json ({id: building.id, name: building.name, tour_position: nil})
      marker.lat building.latitude
      marker.lng building.longitude
      marker.infowindow render_to_string(partial: "/buildings/infowindow", locals: { building: building })
    end
  end

  private

  def find_tour
    @tour ||= Contentful::Tour.find(params[:id])
  end
end
