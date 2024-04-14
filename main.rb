# For this project, you will read in a CSV file Download CSV file that has statistics for 1000 cell phones.
  # You will then create a class called Cell and assign the column as class attributes. Create getter and setter methods.
  # The objects will be stored in a data structure native to the language.
  # You are free to pick what your data structure is but if your language has a HashMap type data structure, I strongly encourage you using it.

# Import built-in CSV library
require 'csv'

# Read CSV file
cells = CSV.read('cells.csv')

# Iterate over the array of arrays, going through each element for the rows of the CSV.
# 'inspect' method returns a string representation of the object it's called on.
cells.each do |row|
  puts row.inspect
end

# Create a class named "Cell"
class Cell
  # Class variable
  @@column = nil

  # Setter method
  def self.column=(value)
    @@column = value
  end

  # Getter method
  def self.column
    @@column
  end
end



# Data Ingestion and Cleaning
  # You must perform transformations on the data as it comes in or after it is been ingested.
  # This a process called data cleaning and these are the steps:
    # Replace all missing or "-" values with null or something similar that can be ignored during calculations.
    # Transform data in appropriate columns according to instructions.
    # For example in the body_weight column, a typical value is '190 g (6.70 oz)'' and needs to be converted to 190.
    # Convert data types in appropriate columns
