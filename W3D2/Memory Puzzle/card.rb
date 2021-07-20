class Card
    CARD_VALUES = ("A".."Z").to_a
    #factory methods - create a specifc instance of the class
    #suppose we have a normal deck of cards, we can create a factory method to create an instance of Cards, that only has red cards
    # factory methods are always class methods, so def self.make_random_cards
    # some code
    #  return the instance at the end, but you have to call Card.new, because we are creating a specific instance of the class

    def self.assign
        #we're going to get value from CARD_VALUES, and then use it to create a card instance
        Card.new(CARD_VALUES.sample)
    end

    def initialize(value, face=false)
        @value = value
        @face = face
    end
end