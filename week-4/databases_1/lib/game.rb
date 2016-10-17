require './lib/printer'

class Game
  include DataMapper::Resource

  property :id, Serial
  has n, :players
  belongs_to :server, model: Player

  def self.start(player_name_1, player_name_2, player_class: Player)
    players = [player_class.create(name: player_name_1), player_class.create(name: player_name_2)]
    game = new(players: players)
    game.start
    game
  end

  def start
    self.server = get_or_choose_initial_server
    save
  end

  def play(printer = Printer.new)
    save
    printer.print_server(server)
    printer.print_winner(random_player)
    self.server = non_server
  end

  private

  def random_player
    [players.first, players.last].sample
  end

  def get_or_choose_initial_server
    return random_player unless server
  end

  def non_server
    server == players.first ? players.last : players.first
  end
end