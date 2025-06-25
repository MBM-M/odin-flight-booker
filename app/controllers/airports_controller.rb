class AirportsController < ApplicationController
  def destroy
    @airport = Airport.find(params[:id])

    if @airport.destroy
      flash[:notice] = "Airport and its associated flights were successfully deleted."
    else
      flash[:alert] = "Failed to delete the airport."
    end

    redirect_to airports_path
  end
end
