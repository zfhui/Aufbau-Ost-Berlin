class BuildingsController < ApplicationController
  include Gmaps4rails
  
  before_action :find_building, only: :show

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

  def show
    @photos = @building.try(:gallery).try(:photos)
    @videos = @building.try(:videos)
  end

  private

  def find_building
    id = params[:id]
    @building = Contentful::Building.find(id)
  end
end
