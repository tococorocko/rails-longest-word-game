require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = (1..10).map { ('A'..'Z').to_a.sample }
  end

  def score
    @score = session[:score]
    session[:score] = 0
    attempt = params[:word]
    letters = params[:letters].split
    url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    user_serialized = open(url).read
    user = JSON.parse(user_serialized)
    attempt_array = attempt.upcase.split("")
    attempt_test = attempt_array.all? { |l| attempt_array.count(l) <= letters.count(l) }
    if user["found"] == true
      if attempt_test == true
        @score += attempt.length
        @result = "Well done! #{attempt} is a valid English word!"
      else
        @score += 0
        @result = "Sorry but #{attempt} can't be build out of #{letters.join(", ")}!"
      end
    else
      @score += 0
      @result = "Sorry but #{attempt} does not seem to be a valid English word!"
    end
    session[:score] += @score
  end
end
