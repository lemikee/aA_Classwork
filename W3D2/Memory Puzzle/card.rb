class Card
    CARD_VALUES = ("A".."Z").to_a
    #factory methods - create a specifc instance of the class
    #suppose we have a normal deck of cards, we can create a factory method to create an instance of Cards, that only has red cards
    # factory methods are always class methods, so def self.make_random_cards
    # some code
    #  return the instance at the end, but you have to call Card.new, because we are creating a specific instance of the class

    def self.assign(pairs)
        #we're going to get value from CARD_VALUES, and then use it to create a card instance
        card = CARD_VALUES.shuffle.take(pairs) * 2 #[A, B, C, D] if pairs==4
        card.map { |value| Card.new(value) }
    end

    attr_reader :value, :face

    def initialize(value, face = true)
        @value = value
        @face = face
    end

    #to_s is a method that converts something object to string form, devs expect you to have it, because they might invoke it

    def hide
        @face = false
    end

    def reveal
        @face = true
    end

    def to_s
        @face ? self.value.to_s : ""
    end

    def ==(card)
        self.value == card.value
    end

end