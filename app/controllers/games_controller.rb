require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    run
    @letters
  end

  def score
    @word = params[:attempts]

  end

  private

  def run
    @letters = generate_grid(10).join
    @start_time = Time.now
  end

  def generate_grid(grid_size)
  Array.new(grid_size) { ('A'..'Z').to_a.sample }
  end

  def computing(word)
  response = open("https://wagon-dictionary.herokuapp.com/#{word}")
  json = JSON.parse(response.read)
  return json['found']
  end

end
