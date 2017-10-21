require 'sinatra'
require 'sinatra/reloader'
  SECRET_NUMBER = rand(101)
    
  def check_guess(guess)

    guess = guess.to_i
    if  guess > SECRET_NUMBER
      message = "Too high!"
    elsif guess < SECRET_NUMBER
      message = "Too low!"
    else
      message = "You got it right! The Secret Number is #{SECRET_NUMBER}"
    end
    message
  end

  get '/' do
    guess = params["guess"]
    message = check_guess(guess)
    erb :index, :locals =>
     {:message => message,
      :number => SECRET_NUMBER }
  end

  