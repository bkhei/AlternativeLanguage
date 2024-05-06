# Alternative Language Project
- Purpose: To practice and demonstrate proficiency in using an alternative programming language of your choice.
- Skills Used: Programming with a new language 
- Knowledge Goals: All programming concepts and structures within a new language

## Summary 
In this assignment for my COP4020: Principles of Programmg Languages course, I was given the opportunity to explore using Ruby as a new programming language, by ingesting and cleaning the data collected from 1000 smartphones. 

## Report

- Why did I pick Ruby for this Project?

  **I chose Ruby as the syntax was more simple compared to languages like C# or Java, and it has more built-in use for processing text. Ruby is also an object oriented language and contans libraries that makes it easy to read CSV files into classes/objects.**
  
- How does Ruby handle object-oriented programming, file ingestion, conditional statements, assignment statements, loops, subprograms (functions/methods), unit testing and exception handling?
 
  **Ruby is completely object-oriented, which meant it was perfect for this type of project. It handles file-ingestion well and only really needs different libraries depending on what you intend to ingest. You can create functions to write to CSVs as well, as I did in this project for testing. Ruby has the same conditionals and assignments as Python sort of has, and I feel like the loops were easier to read compared to Python. With our functions/methods, Ruby has a lot of stuff built-in that sort of handles what I wanted to accomplish for this project. You can define methods in classes, create different methods for converting to strings inside of the class, and even look for unique values within class objects.**
  
- List out 3 libraries you used from your programming language (if applicable) and explain what they are, why you chose them and what you used them for.

  1) **CSV, alongside the descriptive_statistics and RSpec library. The CSV library is mandatory for even reading CSV files in the first place, but it also helped for writing to a new csv file to verify if my output were correct in a readable format.**
  2) **The descriptive_statistics is useful for calculating basic descriptive statistics of numeric sample data in Ruby. We can get means, sums, medians, etc which was useful for answering the questions regarding average weights and most phones released in a specific year.**
  3) **RSpec was used to conduct my unit tests. This one is the simplest library for conducting unit tests and the unit tests required are not very complex.**

- Answer the following questions (and provide a corresponding screen showing output answering them):
  1) What company (oem) has the highest average weight of the phone body?\
  **HP**
  2) Was there any phones that were announced in one year and released in another? What are they? Give me the oem and models.
    - **Motorola: One Hyper and Razr 2019**
    - **Xiaomi: Redmi K30 5G and Mi Mix Alpha**
  3) How many phones have only one feature sensor?\
  **418**
  4) What year had the most phones launched in any year later than 1999?\
  **2019**
## Unit Tests/Exception Handling
- I used RSpec for testing, primarily to ensure that the Cell class works properly and that my initialize method was correctly assigning instance variables and handling the missing or '-' values. To breakdown what I did for the tests...
  - It checks if either 'launch_announced' or 'launch_status' is nil and if it is, it skips to the next phone.
  - If they have values, we assign 'launch_announced' to 'announced_year' and check if 'launch_status' is an integer. We then assign it to 'status_year' if it is. Otherwise, we set 'status_year' to nil.
  - We compare 'announced_year' and 'status_year' to see if they are unique, and if they are NOT 'Discontinued' or 'Cancelled'.
  - If ALL of these prior conditions are met, we output OEM, model, announced year, and released year
  - We create a new array of 'launch_years' using the 'phones' hash.
  - For each phone, if 'launch_announced' is nil, we skip to the next phone.
  - Otherwise, assign 'launch_announced' to year and check if that value is greater than 1999.
  - If that value is greater than 1999, we add the 'year' to our 'launch_years' array, otherwise we just add nil.
  - Finally, we remove all the nil values using the compact function.
  - Calculate the mode of 'launch_years' array, then assign it to 'most_launched_year'.
  - Output the year w/ most launches after 1999.
- The way the unit tests work out ultimately after these is that...
  -  The phones collection isn't empty because the output wouldn't be there if the phones hash was empty.
  -  The data processing transformations are being done properly as the display_size need to be in the correct format to work properly and return the values we wanted, at least in the class method.
  -  Code ends up behaving strangely if we didn't have the nil values, and we had to account for these in nearly every step of our code. Ruby will take count of the ones we have and raise an error accordingly, which leads into...
- Lack of exception handling, and if there was, it'd be on niche scenarios that I noticed wasn't covered in the assignment instructions. For example, we would have cases where phones were discontinued but they were still announced and released in separate years (e.g. Mitac MIO Leap G50 and Leap K1), or where we needed to replace '-' or blanks even when the columns were filled.

## Code Output 
![image](https://github.com/bkhei/AlternativeLanguage/assets/47387636/65c9395e-e8d9-49cb-986b-4b5d83e8a61e)

