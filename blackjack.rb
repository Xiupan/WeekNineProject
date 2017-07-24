$playerTotalMoney = 100
$playerBet = 10

def playerFirstTurn
  puts "You have $#{$playerTotalMoney} and bet $#{$playerBet}."
  puts "You have a #{playerFirstCard} and a #{playerSecondCard} in your hand. Your total is #{playerTotalHandValue}."
  puts
end

puts
puts "Hello and welcome to the game of blackjack! Let's begin."
puts
playerFirstTurn
