class Card
    # CARD_VALUES = ("A".."Z").to_a
    CARD_VALUES = [
        "😂","🥺","👀","😭","🎉","🐈","🪑","🍵","📝","👍","👎","🐥","🐝","💩",
        "🧐","🍕","🍣","🥧", "🍫", "🧋","🍾","⚾️","🍎","🥑","🍉","🔥","🐠"
    ]

    def self.assign(pairs)
        cards = CARD_VALUES.shuffle.take(pairs) * 2
        cards.map { |value| Card.new(value) }
    end

    attr_reader :value
    attr_accessor :face

    def initialize(value, face = false)
        @value = value
        @face = face
    end

    def hide
        @face = false
    end

    def reveal
        @face = true
    end

    def to_s
        @face ? self.value.to_s : " "
    end

    def ==(card)
        card.is_a?(Card.class) && self.value == card.value
    end
end