class Money
  attr_reader :color, :user
  def initialize(color, user)
    @color = color
    @user = user
    @user.add_money(self)
  end
end

class Card

  attr_reader :color, :price
  attr_accessor :user
  #
  # price: { red: 3, green: 1}
  #
  def initialize(color, price)
    @color = color
    @price = price
    @user = nil
  end

  def update_user(u)
    user = u
  end
end

class User
  attr_accessor :cards, :money
  def initialize
    @cards = []
    @money = {}
  end

  # Object[money]
  def add_money(m)
    money[m.color] ||= 0
    money[m.color] += 1
  end

  def add_cards(card)
    cards << card
  end

  def need_money_count(color, count)
    card_count = cards.find_all{|x| x.color === color}.count
    need_count = count - card_count
    need_count > 0 ? need_count : 0
  end

  def has_money_count(color, count)

  end

  def gold_count
    money[:gold]
  end

  def canPurchase(card)
    _gold_count = gold_count
    card.price.each do |color, count|
      need_count = need_money_count(color, count)
      if money[color].to_i < need_count
        diff_count = need_count - money[color].to_i
        if diff_count <= _gold_count
          _gold_count -= diff_count
        else
          return false
        end
      end
    end

    true
  end

  def purchase(card)
    _money = money
    _gold_count = gold_count
    card.price.each do |color, count|
      need_count = need_money_count(color, count)
      if money[color].to_i < need_count
        diff_count = need_count - money[color].to_i
        if diff_count <= _gold_count
          _money[color] = 0
          _gold_count -= diff_count
        else
          return false
        end
      else
        _money[color] -= need_count
      end
    end

    card.update_user(self)
    self.cards << card
    self.money = _money
    self.money[:gold] = _gold_count
    true
  end
end