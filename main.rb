# Import built-in CSV library
# Import library to write to an excel file
require 'csv'
require 'write_xlsx'
require 'descriptive_statistics'

# Read CSV file
cells = CSV.read('cells.csv', headers: true)

# Creating a class named "Cell", and assigning each column as class attributes
# attr_accessor functions as both a getter and setter method in Ruby
class Cell
  attr_accessor :oem,
                :model,
                :launch_announced,
                :launch_status,
                :body_dimensions,
                :body_weight,
                :body_sim,
                :display_type,
                :display_size,
                :display_resolution,
                :features_sensors,
                :platform_os

# Function containing our methods
  def initialize(attributes = {})
    # Replace missing or "-" values with null
    @oem = attributes['oem'].empty? || attributes['oem'] == '-' ? nil : attributes['oem']
    # Replace missing or "-" values with null
    @model = attributes['model'].empty? || attributes['model'] == '-' ? nil : attributes['model']

    # Extract year from launch_announced and convert to integer
    launch_announced = attributes['launch_announced']
    # Check to see if the launch_announced contains V1
    if launch_announced == 'V1'
      @launch_announced = nil
    # Check to see if launch_announced contains a year, then capture the first year encountered and store it as an integer
    else
      year = launch_announced && launch_announced.scan(/\d{4}/).first
      @launch_announced = year ? year.to_i : nil
    end

    # Extract year from launch_status
    @launch_status = attributes['launch_status']
    # Check to see if launch_status contains Discontinued or Cancelled
    if launch_status == 'Discontinued' || launch_status == 'Cancelled'
      @launch_status = launch_status
    # Otherwise, check to see if launch_status contains a year, then capture the first year encountered and store it as an integer
    else
      year = launch_status && launch_status.scan(/\d{4}/).first
      @launch_status = year ? year.to_i : launch_status
    end

    # Replace missing or "-" values with null, store the body dimensions as a string
    @body_dimensions = attributes['body_dimensions'].empty? || attributes['body_dimensions'] == '-' ? nil : attributes['body_dimensions']

    # Extract the body weight from the string and convert to a float
    body_weight = attributes['body_weight']

    # Check if body_weight is not nil and is a string
    if body_weight.is_a?(String)
      # Extract the first number from the string
      weight_in_grams = body_weight.scan(/\d+\.?\d*/).first
    end

    # Check to encounter the first integer or float in the string and store it as a float
    weight_in_grams = body_weight && body_weight.scan(/\d+\.?\d*/).first
    @body_weight = weight_in_grams ? "#{weight_in_grams} g" : nil

    # Extract the SIM card type from the string
    body_sim = attributes['body_sim']
    # Check to see if body_sim contains oddities (Yes/No)
    @body_sim = if %w[No Yes].include?(body_sim)
                  nil
                else
                  body_sim
                end

    # Replace missing or "-" values with null
    @display_type = attributes['display_type'].empty? || attributes['display_type'] == '-' ? nil : attributes['display_type']

    # Extract the display size from the string and convert to a float
    display_size = attributes['display_size']
    size_in_inches = display_size && display_size.scan(/(\d+(\.\d+)?)/).flatten.first
    @display_size = size_in_inches ? "#{size_in_inches} inches" : nil

    # Replace missing or "-" values w/ null
    @display_resolution = attributes['display_resolution'].nil? || attributes['display_resolution'] == '-' ? nil : attributes['display_resolution']

    # Replace missing or "-" values w/ null
    # For unit testing purposes, remember the Cells.csv doesn't have invalid attributes in this column
    @features_sensors = attributes['features_sensors'].empty? || attributes['features_sensors'] == '-' ? nil : attributes['features_sensors']

    # Extract the platform OS from the string
    platform_os = attributes['platform_os']
    first_os = platform_os && platform_os.split(',', 2).first
    @platform_os = first_os
  end

  # Method that will convert object details to a string for printing (CSV)
  def toString
    body_weight_str = @body_weight && @body_weight % 1 == 0 ? @body_weight.to_i.toString : @body_weight.toString
    "OEM: #{@oem},
    Model: #{@model},
    Launch Announced: #{@launch_announced},
    Launch Status: #{@launch_status},
    Body Dimensions: #{@body_dimensions},
    Body Weight: #{body_weight_str} g,
    Body SIM: #{@body_sim},
    Display Type: #{@display_type},
    Display Size: #{@display_size},
    Display Resolution: #{@display_resolution},
    Features Sensors: #{@features_sensors},
    Platform OS: #{@platform_os}"
  end

  # Method to array of unique values for a given column
  def self.unique_values(cells, column)
    cells.map { |cell| cell.send(column) }.uniq
  end
end

# Creating a data structure to store each phone in hash
phones = {}

# Writing transformed data to a new CSV file
CSV.open("transformed_data.csv", "wb") do |csv|
  # Write the headers to CSV file
  headers = ['OEM', 'Model', 'Launch Announced', 'Launch Status', 'Body Dimensions', 'Body Weight', 'Body SIM', 'Display Type', 'Display Size', 'Display Resolution', 'Features Sensors', 'Platform OS']
  csv << headers
  # Write data to the CSV file
  phones.each do |model, cell|
    data = [cell.oem, model, cell.launch_announced, cell.launch_status, cell.body_dimensions, cell.body_weight, cell.body_sim, cell.display_type, cell.display_size, cell.display_resolution, cell.features_sensors, cell.platform_os]
    csv << data
  end
end
