# For this project, you will read in a CSV file Download CSV file that has statistics for 1000 cell phones.
  # You will then create a class called Cell and assign the column as class attributes. Create getter and setter methods.
  # The objects will be stored in a data structure native to the language.
  # You are free to pick what your data structure is but if your language has a HashMap type data structure, I strongly encourage you using it.

  # Data Ingestion and Cleaning
  # You must perform transformations on the data as it comes in or after it is been ingested.
  # This a process called data cleaning and these are the steps:
    # Replace all missing or "-" values with null or something similar that can be ignored during calculations.
    # Transform data in appropriate columns according to instructions.
    # For example in the body_weight column, a typical value is '190 g (6.70 oz)'' and needs to be converted to 190.
    # Convert data types in appropriate columns

# Methods
  # Within each class, you will create a series of methods that will perform operations on the new objects.
  # There must be at least 7 methods/functions in your Cell class, not including getter and setter methods or the methods you use for transformation.
  # Be creative and think critically, its your choice on what these are.
  # Some ideas:
    # ToString method that will convert your objects details to a string for printing.
    #Calculate statistics on columns, for numeric, descriptive stats such as mean, median, standard deviation, etc. For categorical columns, perhaps Mode or count of unique values.
    # Listing of unique values for each column.
    # Ability to add an object and input data for each object's variable.
    # Ability to delete an object.

# Exceptions
   #Ensure that you have exceptions that can handle errors.
    # Focus on input validation. You do not need to validate everything,
    # but have a robust number of exception handling in your project to show you are making your program secure and able to survive poor user input.

# Testing
 # If your programming language has unit testing capability such as junit or pyunit, use that for your unit tests. If not, write your own unit tests for each method. On top of a unit test for each method, there are three tests you are required to have:
  # Ensure the file being read is not empty.
  # Ensure each column's final transformation matches what is stated above as its final form (ex: test if display_size is now a float)
  # Ensure all missing or "-" data is replaced with a null value.


# Import built-in CSV library
require 'csv'

# Read CSV file
cells = CSV.read('cells.csv', headers: true)

# Iterate over the array of arrays, going through each element for the rows of the CSV.
# 'inspect' method returns a string representation of the object it's called on.

cells.each do |row|
  puts row.inspect
end



# Create a class named "Cell", and assigning each column as class attributes
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
    @oem = attributes['oem']
    @model = attributes['model']
    @launch_announced = attributes['launch_announced']
    @launch_status = attributes['launch_status']
    @body_dimensions = attributes['body_dimensions']
    @body_weight = attributes['body_weight']
    @body_sim = attributes['body_sim']
    @display_type = attributes['display_type']
    @display_size = attributes['display_size']
    @display_resolution = attributes['display_resolution']
    @features_sensors = attributes['features_sensors']
    @platform_os = attributes['platform_os']
  end
end

# Creating a data structure to store each phone in hash
phones = {}

# Convert each row in the CSV to a hash
cells.each do |row|
  cell = Cell.new(row.to_h)
  phones[cell.model] = cell
end

puts phones.inspect
