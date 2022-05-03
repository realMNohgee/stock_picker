

def stock_picker(stocks)

  best_buy= nil
  best_sell = nil
  max_profit = 0

  #every valid buy date as an index to the price array (-2 because can't buy on last day)
  (0..(stocks.length - 2)).each do |buy_date|
    #then I iterate through every sell date starting from a given buy date
    ((buy_date + 1)..stocks.length - 1).each do |sell_date|
      
      #check the profit for this pair of days
      price_difference = stocks[sell_date] - stocks[buy_date]
      
      #see if this is the best profit so far, if so save it
      if price_difference > max_profit
        best_buy = buy_date
        best_sell = sell_date
        max_profit = price_difference
      end
    end
  end
  
  #this way, once you've exited the iteration above, you've already got what you need!
  #printing it out for fun:
  puts "day #{best_buy}: buy at #{stocks[best_buy]}"
  puts "day #{best_sell}: sell at #{stocks[best_sell]}"
  puts "profit of #{max_profit}"
  
  return [best_buy, best_sell]
end

stock_picker([17,3,6,9,15,8,6,1,10])