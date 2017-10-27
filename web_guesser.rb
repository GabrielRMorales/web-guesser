require 'sinatra'
require 'sinatra/reloader'

  @@number = rand(101)
  @@guesses=5
  #@@cheat=false

  def check_guess(guess)

    guess = guess.to_i
    if guess > @@number
      message = "Too high!"
      background = "red"
      message=no_more_guesses(message)
    elsif guess < @@number
      message = "Too low!"
      background = "green"
      message=no_more_guesses(message)
    else
      @@number = rand(101)
      @@guesses=5
      message = "You got it right! The Secret Number is #{@@number}. Generating new number."
    end
    [message, background]
    
  end

 def cheat_on()
    answer = "test"
    answer = "CHEAT MODE ON" if @@cheat==true
    answer
  end

  def no_more_guesses(message)
    @@guesses-=1
      if @@guesses==0
        @@number = rand(101)
        @@guesses=5
        return "You lost. Generating new number."
      end
    return message
  end  

  get '/' do
    guess = params["guess"]
    @@cheat = params["cheat"]
    message, background = check_guess(guess)
    answer = cheat_on
    erb :index, :locals =>
     {:message => message,
      :number => @@number,
      :background=> background,
      :guesses => @@guesses,
      :answer => answer
       }
  end

