class FlightsController < ApplicationController
  def index
    @airport = Airport.all

    @available_dates = Flight.pluck(:start_datetime).map { |dt| dt.to_date }.uniq.sort

    if params[:departure_code].present? && params[:arrival_code].present? && params[:date].present?
      dep = Airport.where(code: params[:departure_code])
      arr = Airport.where(code: params[:arrival_code])
      search_date = Date.parse(params[:date])
      start_of_day = search_date.beginning_of_day
      end_of_day = search_date.end_of_day

      @flights = Flight.where(dep_airport_id: dep, arr_airport_id: arr, start_datetime: start_of_day..end_of_day)
    else
      @flights = Flight.none
    end
  end
end
