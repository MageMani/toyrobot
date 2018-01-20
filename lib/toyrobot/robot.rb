module Toyrobot
  class Robot

    def initialize

    end

    def place(x,y,d)
      @x_coordinate = x
      @y_coordinate = y
      @direction = d
      @position = "#{@x_coordinate},#{@y_coordinate},#{@direction}"
    end

    def report
        if @position
          @position
        else
          @position = "position is not available"
        end
    end

    def move
      position = report
      if position != "position is not available"
        @x_coordinate = position.split(',')[0]
        @y_coordinate = position.split(',')[1]
        @direction = position.split(',')[2]
        @x_coordinate = @x_coordinate.to_i
        @y_coordinate = @y_coordinate.to_i

        case @direction
        when "NORTH"
          if  @y_coordinate < 4
            @y_coordinate += 1
            @y_coordinate.to_s
          end
        when "EAST"
          if  @x_coordinate < 4
          @x_coordinate += 1
          @x_coordinate.to_s
          end
        when "SOUTH"
          if  @y_coordinate > 0
          @y_coordinate -= 1
          @y_coordinate.to_s
        end
        else
          if  @x_coordinate > 0
          @x_coordinate -= 1
          @x_coordinate.to_s
          end
        end

        @position = "#{@x_coordinate},#{@y_coordinate},#{@direction}"
      else
         @position
      end
    end

    def right
      position = report
      @x_coordinate = position.split(',')[0]
      @y_coordinate = position.split(',')[1]
       @direction = position.split(',')[2]
      case @direction
      when "NORTH"
        @direction = "EAST"
      when "EAST"
        @direction = "SOUTH"
      when "SOUTH"
        @direction = "WEST"
      else
        @direction = "NORTH"
      end
      @position = "#{@x_coordinate},#{@y_coordinate},#{@direction}"

    end
    def left
      position = report
      @direction = position.split(',')[2]
      case @direction
      when "NORTH"
        @direction = "WEST"
      when "EAST"
        @direction = "NORTH"
      when "SOUTH"
        @direction = "EAST"
      else
        @direction = "SOUTH"
        end
      @position = "#{@x_coordinate},#{@y_coordinate},#{@direction}"

    end


end
end
