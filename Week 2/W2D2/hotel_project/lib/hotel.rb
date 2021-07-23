require_relative "room"

class Hotel
    attr_reader :rooms

    def initialize(name, hash)
        @name = name

        @rooms = {}

        hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        parts = @name.split(" ")
        capped = parts.map { |part| part.capitalize }
        capped.join(" ")
    end

    def room_exists?(room)
        rooms.has_key?(room)
    end

    def check_in(person, room)
        if room_exists?(room)
            if @rooms[room].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.any? { |room_name, instance| instance.available_space > 0}
    end

    def list_rooms
        @rooms.each do |room_name, instance|
                puts "#{room_name} : #{instance.available_space}"
        end
    end

end
