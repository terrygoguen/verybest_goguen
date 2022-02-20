class VenuesController < ApplicationController
  before_action :set_venue, only: %i[show edit update destroy]

  def index
    @q = Venue.ransack(params[:q])
    @venues = @q.result(distinct: true).includes(:bookmarks, :users,
                                                 :dishes).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@venues.where.not(physical_address_latitude: nil)) do |venue, marker|
      marker.lat venue.physical_address_latitude
      marker.lng venue.physical_address_longitude
    end
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @venue = Venue.new
  end

  def edit; end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      redirect_to @venue, notice: "Venue was successfully created."
    else
      render :new
    end
  end

  def update
    if @venue.update(venue_params)
      redirect_to @venue, notice: "Venue was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @venue.destroy
    redirect_to venues_url, notice: "Venue was successfully destroyed."
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:dish_id, :physical_address,
                                  :neighborhood_id)
  end
end
