=begin
Methods
  Within each class, you will create a series of methods that will perform operations on the new objects.
  There must be at least 7 methods/functions in your Cell class, not including getter and setter methods or the methods you use for transformation.
  Be creative and think critically, its your choice on what these are.
  Some ideas:
    - ToString method that will convert your objects details to a string for printing.
    - Calculate statistics on columns, for numeric, descriptive stats such as mean, median, standard deviation, etc. For categorical columns, perhaps Mode or count of unique values.
    Listing of unique values for each column.
    Ability to add an object and input data for each object's variable.
    Ability to delete an object.

Exceptions
   Ensure that you have exceptions that can handle errors.
    Focus on input validation. You do not need to validate everything,
    but have a robust number of exception handling in your project to show you are making your program secure and able to survive poor user input.

Testing
 If your programming language has unit testing capability such as junit or pyunit, use that for your unit tests. If not, write your own unit tests for each method. On top of a unit test for each method, there are three tests you are required to have:
  Ensure the file being read is not empty.
  Ensure each column's final transformation matches what is stated above as its final form (ex: test if display_size is now a float)
  Ensure all missing or "-" data is replaced with a null value.

 # Data Ingestion and Cleaning
  # You must perform transformations on the data as it comes in or after it is been ingested.
    # 1) Replace all missing or "-" values with null or something similar that can be ignored during calculations.
    # 2) Transform data in appropriate columns according to instructions (ex: body_weight column, '190 g (6.70 oz)'' > 190)
    # 3) Convert data types in appropriate columns

    oem is treated as a string // Replace missing or "-" values with null
    model is treated as a string // Replace missing or "-" values with null
    launch_announced is treated as integer (Year) // Values containing "V1" must be replaced with null
    launch_status is treated as a string (Year or "Discontinued" or "Cancelled") //
    body_dimensions is treated as a string (Height x Width x Thickness in mm or inches) // Replace missing or "-" values with null
    body_weight is treated as an float (in grams) // String w/ integer in it before letter g
    body_sim is treated as a string // Replace "No" with null, replace "Yes" w/ "Mini-SIM"
    display_type is treated as a string // Replace missing or "-" values with null
    display_size is treated as a float (in inches) // String w/ integer or float before the word "inches"
    display_resolution is treated as a string // Replace missing or "-" values with null
    features_sensors is treated as a string // Replace missing or "-" values with null. Replace integers w/ null
    platform_os is treated as a string // Replace instances of floats to integers (e.g. "Android 4.4.2" to "Android 4")

=end
# For this project, you will read in a CSV file Download CSV file that has statistics for 1000 cell phones.
# Import built-in CSV library
require 'csv'
require 'descriptive_statistics'

# Read CSV file
cells = CSV.read('cells.csv', headers: true)

# Iterate over the array of arrays, going through each element for the rows of the CSV.
# 'inspect' method returns a string representation of the object it's called on.

cells.each do |row|
  puts row.inspect
end

# You will then create a class called Cell and assign the column as class attributes. Create getter and setter methods.
# Creating a class named "Cell", and assigning each column as class attributes
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
      year = launch_anhnounced && launch_announced.scan(/\d{4}/).first
    @launch_announced = year ? year.to_i : nil
    end

    # Extract year from launch_status
    # Keep in mind there are no instances of V1 in this column, so we don't need to do any replacements outside of the year
    @launch_status = attributes['launch_status']
    # Check to see if launch_status contains Discontinued or Cancelled
    if launch_status == 'Discontinued' || launch_status == 'Cancelled'
      @launch_status = launch_status
    # Otherwise, check to see if launch_status contains a year, then capture the first year encountered and store it as an integer
    else
      year = launch_status && launch_status.scan(/\d{4}/).first
      @launch_status = year ? year.to_i : launch_status
    end

    # Replace missing or "-" values with null
    @body_dimensions = attributes['body_dimensions'].empty? || attributes['body_dimensions'] == '-' ? nil : attributes['body_dimensions']

    # Extract the body weight from the string and convert to a float
    body_weight = attributes['body_weight']
    # Check to encounter the first integer or float in the string and store it as a float
    weight_in_grams = body_weight && body_weight.scan(/\d+(\.\d+)?/).first
    @body_weight = weight_in_grams ? weight_in_grams.to_f : nil

    # Extract the SIM card type from the string
    body_sim = attributes['body_sim']
    # Check to see if body_sim contains oddities (Yes/No)
    if body_sim == 'No' || body_sim == 'Yes'
      @body_sim = nil
    else
      @body_sim = body_sim
    end

    # Replace missing or "-" values with null
    @display_type = attributes['display_type'].empty? || attributes['display_type'] == '-' ? nil : attributes['display_type']


    # Extract the display size from the string and convert to a float
    display_size = attributes['display_size']
    size_in_inches = display_size && display_size.scan(/\d+(\.\d+)?/).first
    @display_size = size_in_inches ? "#{size_in_inches} inches" : nil

    # Replace missing or "-" values with null
    @display_resolution = attributes['display_resolution'].empty? || attributes['display_resolution'] == '-' ? nil : attributes['display_resolution'] # Replace missing or "-" values with null

    # Replace missing or "-" values with null
    # For unit testing purposes, remember the Cells.csv doesn't have invalid attributes in this column
    @features_sensors = attributes['features_sensors'].empty? || attributes['features_sensors'] == '-' ? nil : attributes['features_sensors']

    # Extract the platform OS from the string
    platform_os = attributes['platform_os']
    first_os = platform_os && platform_os.split(',', 2).first
    @platform_os = first_os

  end

  # Method that will convert objects details to a string for printing
  def to_s
    body_weight_str = @body_weight && @body_weight % 1 == 0 ? @body_weight.to_i.to_s : @body_weight.to_s
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

# The objects will be stored in a data structure native to the language.
# You are free to pick what your data structure is but if your language has a HashMap type data structure, I strongly encourage you using it.
# Creating a data structure to store each phone in hash
phones = {}

# Convert each row in the CSV to a hash object
cells.each do |row|
  cell = Cell.new(row.to_h)
  phones[cell.model] = cell
end

phones.each do |model, cell |
  puts cell.to_s
end
