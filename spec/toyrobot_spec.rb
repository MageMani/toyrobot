RSpec.describe Toyrobot do
  it "has a version number" do
    expect(Toyrobot::VERSION).not_to be nil
  end

  it "reports its position" do
    position = "0,0,SOUTH"
    toyrobot = Toyrobot::Robot.new
    toyrobot.place(0,0,"SOUTH")
    expect(toyrobot.report).to eq(position)
  end

  it "moves" do
    toyrobot = Toyrobot::Robot.new
    toyrobot.place(2,1,"NORTH")
    toyrobot.move
    position="2,2,NORTH"
    expect(toyrobot.report).to eq(position)
  end

  it "it doesn't move without position" do
    toyrobot = Toyrobot::Robot.new
    #toyrobot.place(2,1,"NORTH")
    toyrobot.move
    #position="2,2,NORTH"
    position = "position is not available"
    expect(toyrobot.report).to eq(position)
  end


  it "rotates right" do
    toyrobot = Toyrobot::Robot.new
    toyrobot.place(2,1,"NORTH")
    position="2,1,EAST"
    toyrobot.right
    expect(toyrobot.report).to eq(position)
  end

  it "rotates left" do
    toyrobot = Toyrobot::Robot.new
    toyrobot.place(2,1,"NORTH")
    position="2,1,WEST"
    toyrobot.left
    expect(toyrobot.report).to eq(position)
  end

  it "moves NORTH from the edge" do
    toyrobot = Toyrobot::Robot.new
    toyrobot.place(2,4,"NORTH")
    toyrobot.move
    position="2,4,NORTH"
    expect(toyrobot.report).to eq(position)
   end
   it "moves WEST from the edge" do
     toyrobot = Toyrobot::Robot.new
     toyrobot.place(0,4,"WEST")
     toyrobot.move
     position="0,4,WEST"
     expect(toyrobot.report).to eq(position)
    end
    it "moves SOUTH from the edge" do
      toyrobot = Toyrobot::Robot.new
      toyrobot.place(3,0,"SOUTH")
      toyrobot.move
      position="3,0,SOUTH"
      expect(toyrobot.report).to eq(position)
     end
     it "moves EAST from the edge" do
       toyrobot = Toyrobot::Robot.new
       toyrobot.place(4,4,"EAST")
       toyrobot.move
       position="4,4,EAST"
       expect(toyrobot.report).to eq(position)
      end

      it "Follows the Sequence" do
        toyrobot = Toyrobot::Robot.new
        toyrobot.place(2,1,"NORTH")
        toyrobot.move
        toyrobot.right
        toyrobot.move
        toyrobot.move
        toyrobot.left
        position="4,2,NORTH"
        #position="I am a clown"
        expect(toyrobot.report).to eq(position)
       end
end
