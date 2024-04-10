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

# Set class attributes 
Cell.column = "A"
puts Cell.column
puts 