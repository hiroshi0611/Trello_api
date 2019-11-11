require 'trello'
require 'pry'


def puts_todos
    configure
    cards = get_cards

    puts '======================='
    puts '[TODO]'
    cards.each do |card|
        puts card.name
    end
    puts '======================='
end


def configure
  Trello.configure do |config|
    config.developer_public_key = '66513c3300b80d101dd128c4581613a5' # The "key" from step 1
    config.member_token = '7d25ed13128e8791314319c26f957a1481f85e76b8851f7473549ff14a6901b3' # The token from step 2.
  end
end


def get_cards
  member = Trello::Member.find('imaizumi_hiroshi')
  boards = member.boards
  board = boards.find { |board| board.name == 'TODO' }
  list = board.lists[0]
  cards = list.cards
  cards
end


puts_todos