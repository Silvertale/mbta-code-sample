require 'csv'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @departures_file = File.read("public/Departures.csv")
    lines = @departures_file.split("\n")
    headers = []
    lines.first.split(",").each do |head| #use the headers to build hashes of the rest of the lines
      headers.push(head.downcase.gsub("\r", ""))
    end

    lines.delete_at(0) #we don't need the headers anymore
    @departures = []
    lines.each do |line|
      values = line.split(",")
      hash = {}
      values.each_with_index do |value, index|
        puts("setting value: " + value.gsub('"', "").to_s)
        hash[headers[index]] = value.gsub('"', "") #set values with header values dynamically. Strings have an extra set of quotes. Remove them
        if(headers[index] == "scheduledtime")
          hash[headers[index]] = Time.at(value.gsub('"', "").to_i).strftime "%H:%M%p"
        end
      end
      @departures.push(hash) #header:value pairs
    end
    @departures_string = @departures.to_json
  end


end
