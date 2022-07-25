
#clock class

class Clock
        attr_accessor :seconds, :minutes, :hours, :tick, :time

        def initialize (seconds,minutes, hours, tick, time)
            @seconds = Counter.new("seconds", 0, 0, 0,0)
            @minutes = Counter.new("minutes", 0, 0, 0,0)
            @hours = Counter.new("hours", 0, 0, 0,0)
            @tick = tick
            @time = time
        end
        
        def clock_reset
            @seconds.reset
            @minutes.reset
            @hours.reset
        end

        def tick
            @seconds.ticks = @seconds.increment          
            if @seconds.ticks == 60
                @seconds.reset
                @minutes.ticks = @minutes.increment
            end
            if @minutes.ticks == 60
                @minutes.reset
                @hours.ticks = @hours.increment
            end
            if @hours.ticks == 24
                clock_reset
            end
        end

        def time
            puts ("%02d" % hours.ticks.to_s + ":" + "%02d" % minutes.ticks.to_s + ":" + "%02d" % seconds.ticks.to_s)
        end

end

#Counter class

class Counter
        attr_accessor :name,:count, :ticks, :increment, :reset

        def initialize (name, count, ticks,increment, reset)
            @name = name
            @count = count
            @ticks = ticks
            @increment = increment
            @reset = reset
            def ticks
                return count
            end
        end

        def increment
            @count = @count +1
        end

        def reset
            @count = 0
        end
end


#program class

def program
    seconds = 0
    minutes = 0
    hours = 0
    tick = 0
    time = []
    myclock = Clock.new(seconds,minutes,hours,tick,time)
    for i in 0...86400
        myclock.tick
        myclock.time
    end
end


def main()
    program
end

main() 