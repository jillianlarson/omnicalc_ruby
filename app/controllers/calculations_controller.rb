class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(" ", "").length

    @word_count = @text.split.count

    @occurrences = @text.split.count(@special_word)
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f
    @months = @years*12
    @aprmonth = @apr/12/100
    @expo = (1 + @aprmonth)**@months
    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================


    @monthly_payment = (@principal*@expo*@aprmonth)/ (@expo - 1)
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending - @starting
    @minutes = @seconds/60
    @hours = @minutes/60
    @days = @hours/24
    @weeks = @days/7
    @years = @weeks/52
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)
    @sorted_numbers = @numbers.sort
    @count = @numbers.count
    @minimum = @numbers.min
    @maximum = @numbers.max
    @range = @maximum - @minimum
def median(list_of_numbers)
       len = list_of_numbers.length
       if len.odd?
        return list_of_numbers[(len - 1) / 2]
       else len.even?
        return (list_of_numbers[len/2] + list_of_numbers[len/2 - 1])/2.to_f
    end
   end

    @median = median(@sorted_numbers)
def sum(list_of_numbers)
    running_total = 0
    list_of_numbers.each do |number|
    running_total = running_total + number
  end
      return running_total
 end

    @sum = sum(@sorted_numbers)
    @mean = @sum/@numbers.count

def variance(list_of_numbers)
    average = sum(list_of_numbers) / list_of_numbers.count

        diff = 0
        sq_diff=0
        sum_sq=0
        var = 0
        list_of_numbers.each do |number|

            diff = number - average
            sq_diff = diff**2
            sum_sq =  sum_sq + sq_diff

        end

        var = sum_sq / list_of_numbers.count
        return var

    end

    @variance = variance(@sorted_numbers)
    @standard_deviation = Math::sqrt(@variance)

def mode(list_of_numbers)

        len = list_of_numbers.length
        i=1
        max_f = 0
        temp_f = 0
        test = list_of_numbers[0]
        mode = list_of_numbers[0]

        while i <= len - 1

                if number = test

                    temp_f = temp_f + 1

                elsif temp_f > max_f

                    max_f = temp_f

                    mode = test
end

i = i + 1
test = list_of_numbers[i]
end

return mode

end

    @mode = mode(@sorted_numbers)
end

end
