
$totalMoney = 100
$bet = 10
$cards = ["A",2,3,4,5,6,7,8,9,"J","Q","K"]
$randomCardValue = 0

def greeting
  puts "Hello and welcome to the game of blackjack! Let's begin."
end

def getRandomCard
  return $cards.sample
end

def valueOfFaceCard(input)
  if input == "A"
    $randomCardValue = 1
  elsif input == "J" || input == "Q" || input == "K"
    $randomCardValue = 10
  else
    $randomCardValue = input
  end
end

def firstTurn
  randomCard = getRandomCard
  valueOfFaceCard(randomCard)
  puts "You have $#{$totalMoney} and bet $#{$bet}."
  print "You have a #{randomCard} and a "
  cardOne = $randomCardValue
  randomCard = getRandomCard
  print "#{randomCard} in your hand. "
  valueOfFaceCard(randomCard)
  cardTwo = $randomCardValue
  totalHandValue = cardOne + cardTwo
  print "Your total is #{totalHandValue}."
  puts
  print "Do you want to (h)it or (s)tand? "
end

def hitOrStand(choice)
  if choice == "h"
    puts "You hit."
  elsif choice == "s"
    puts "You stand."
  else
    print "Invalid choice, (h)it or (s)tand? "
    userChoice = gets
    hitOrStand(userChoice.chomp)
  end
end

puts
greeting
puts
firstTurn
userChoice = gets
hitOrStand(userChoice.chomp)
