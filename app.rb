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

  before do
    @game = Game.instance
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2)
    redirect('/play')
  end

  get '/play' do
    erb :play
  end

  post '/attack' do
    #Attack.run($game.opponent_of($game.current_turn))
    if @game.game_over?
      redirect "/game_over"
    else
      redirect "/attack"
    end
  end

  get "/attack" do
    @game.attack(@game.opponent_of(@game.current_turn))
    erb :attack
  end

  post "/paralyze" do
    @game.paralyze(@game.opponent_of(@game.current_turn))
    erb :paralyze
  end

  post "/poison" do
    erb :poison
  end

  post "/sleep" do
    erb :sleep
  end

  get '/switch_turn' do
    @game.switch_turn
    redirect('/play')
  end

  get "/game_over" do
    erb :game_over
  end

  run! if app_file == $0
end
