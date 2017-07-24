$totalMoney = 100
$bet = 10
$cards = ["A",2,3,4,5,6,7,8,9,"J","Q","K"]
$randomCardValue = 0
$totalDealerHandValue = 0

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



def dealerFirstTurn
  dealerCardOne = getRandomCard
  valueOfFaceCard(dealerCardOne)
  $totalDealerHandValue += $randomCardValue
  dealerCardTwo = getRandomCard
  valueOfFaceCard(dealerCardTwo)
  $totalDealerHandValue += $randomCardValue

  # case $totalDealerHandValue
  # when 0..16 then
  #   puts "The dealer hits."
  #   dealerNextCard = getRandomCard
  #   valueOfFaceCard(dealerNextCard)
  #   $totalDealerHandValue += $randomCardValue
  # when 17..21 then
  #   print "The dealer stands. "
  #   return
  # when 22..9999 then
  #   puts
  #   puts "The dealer busts!"
  #   return
  # end
  # print "The dealer has a total of #{$totalDealerHandValue}."
  # puts
end

def firstTurn
  randomCard = getRandomCard
  valueOfFaceCard(randomCard) # if the randomCard is equal to A,J,Q, or K, it sets an appropriate value
  puts "You have $#{$totalMoney} and bet $#{$bet}."
  print "You have a #{randomCard} and a " # displays the first random card
  $cardOneRank = randomCard
  $cardOne = $randomCardValue # sets value of the first random card
  randomCard = getRandomCard # runs .sample again to get the second card before displaying it
  print "#{randomCard} in your hand. "
  $cardTwoRank = randomCard
  valueOfFaceCard(randomCard) # sets appropriate value again
  $cardTwo = $randomCardValue # sets value of the second random card
  $totalHandValue = $cardOne + $cardTwo
  print "Your total is #{$totalHandValue}."
  puts
  print "Do you want to (h)it or (s)tand? "
end

def hitOrStand(choice)
  if choice == "h"
    randomCard = getRandomCard # runs randomization again
    valueOfFaceCard(randomCard) # converts face cards to value equivilent
    $cardThree = $randomCardValue
    $totalHandValue = 0
    $totalHandValue = $cardOne + $cardTwo + $cardThree
    puts
    puts "You hit. You now have a #{$cardOneRank}, #{$cardTwoRank}, and #{randomCard} in your hand. Your total is #{$totalHandValue}."
    if $totalHandValue > 21
      bust
      return firstTurn
    end
    puts
    print "Do you want to (h)it or (s)tand? "
    userChoice = gets
    hitOrStand(userChoice.chomp)
  elsif choice == "s"
    puts
    puts "You stand. Your total is #{$totalHandValue}."
    puts
  else
    print "Invalid choice, (h)it or (s)tand? "
    userChoice = gets
    hitOrStand(userChoice.chomp)
  end
  dealerFirstTurn
end

def bust
  puts "You bust!"
end

puts
greeting
puts
firstTurn
userChoice = gets
hitOrStand(userChoice.chomp)
