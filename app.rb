require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  #get '/' do
  #  'Testing infrastructure working!'
  #end

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect('/play')
  end

  get '/play' do
    @game = $game
    erb :play
  end

  post '/attack' do
    #Attack.run($game.opponent_of($game.current_turn))
    if $game.game_over?
      redirect "/game_over"
    else
      redirect "/attack"
    end
  end

  get "/attack" do
    @game = $game
    @game.attack(@game.opponent_of(@game.current_turn))
    erb :attack
  end

  post "/paralyze" do
    @game = $game
    @game.paralyze(@game.opponent_of(@game.current_turn))
    erb :paralyze
  end

  get '/switch_turn' do
    $game.switch_turn
    redirect('/play')
  end

  get "/game_over" do
    @game = $game
    erb :game_over
  end

  run! if app_file == $0
end
