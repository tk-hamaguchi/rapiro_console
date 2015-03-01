class RapiroConsole::Main
  attr_reader :body, :left_eye, :right_eye
  def initialize
    @body = RapiroWrapper::Body.new
    @left_eye = I2cLedMatrix8x8::Device.new(0x70)
    @right_eye = I2cLedMatrix8x8::Device.new(0x71)
    @left_eye.brightness(4)
    @right_eye.brightness(4)
    @body.eyes = '#002080'
    @body.execute!(5)
    @help = ''
    @actions = {}
    RapiroConsole::Action.find_actions.each do |k|
      @help += "\t" + k.const_get(:COMMAND).join(',') + "\t\t" + k.const_get(:DESCRIPTION) + "\n"
      k.const_get(:COMMAND).each { |act| @actions[act] = k }
    end
    [[
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 1 1 1 1 1 1 1 1 ),
      %w( 1 1 1 1 1 1 1 1 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 )
    ], [
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 1 1 1 1 0 0 ),
      %w( 1 1 0 0 1 1 1 1 ),
      %w( 1 1 1 1 1 0 1 1 ),
      %w( 0 0 1 1 1 1 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 )
    ], [
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 1 1 1 1 0 0 ),
      %w( 1 1 0 0 1 1 1 1 ),
      %w( 1 1 0 0 1 1 1 1 ),
      %w( 1 1 1 1 1 1 1 1 ),
      %w( 1 1 1 1 1 0 1 1 ),
      %w( 0 0 1 1 1 1 0 0 ),
      %w( 0 0 0 0 0 0 0 0 )
    ], [
      %w( 0 0 1 1 1 1 0 0 ),
      %w( 0 1 1 1 1 1 1 0 ),
      %w( 1 1 0 0 1 1 1 1 ),
      %w( 1 1 0 0 1 1 1 1 ),
      %w( 1 1 1 1 1 1 1 1 ),
      %w( 1 1 1 1 1 0 1 1 ),
      %w( 0 1 1 1 1 1 1 0 ),
      %w( 0 0 1 1 1 1 0 0 )
    ]].each do |frame|
      @right_eye.write(frame)
      @left_eye.write(frame)
      sleep 0.05
    end
  end

  def execute!
    loop do
      print 'RAPIRO> '
      command = gets
      if @actions.keys.include?(command.strip)
        @actions[command.strip].new(body: @body, right_eye: @right_eye, left_eye: @left_eye).execute!
      else
        case command.strip
        when '?', 'help', 'h'
          print @help
        else
        p command.strip
        end
      end
    end
  rescue Interrupt
    print "exit\n"

    [[
      %w( 0 0 1 1 1 1 0 0 ),
      %w( 0 1 1 1 1 1 1 0 ),
      %w( 1 1 0 0 1 1 1 1 ),
      %w( 1 1 0 0 1 1 1 1 ),
      %w( 1 1 1 1 1 1 1 1 ),
      %w( 1 1 1 1 1 0 1 1 ),
      %w( 0 1 1 1 1 1 1 0 ),
      %w( 0 0 1 1 1 1 0 0 )
    ], [
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 1 1 1 1 0 0 ),
      %w( 1 1 0 0 1 1 1 1 ),
      %w( 1 1 0 0 1 1 1 1 ),
      %w( 1 1 1 1 1 1 1 1 ),
      %w( 1 1 1 1 1 0 1 1 ),
      %w( 0 0 1 1 1 1 0 0 ),
      %w( 0 0 0 0 0 0 0 0 )
    ], [
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 1 1 1 1 0 0 ),
      %w( 1 1 0 0 1 1 1 1 ),
      %w( 1 1 1 1 1 0 1 1 ),
      %w( 0 0 1 1 1 1 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 )
    ], [
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 1 1 1 1 1 1 1 1 ),
      %w( 1 1 1 1 1 1 1 1 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 )
    ], [
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 ),
      %w( 0 0 0 0 0 0 0 0 )
    ]].each do |frame|
      @right_eye.write(frame)
      @left_eye.write(frame)
      sleep 0.05
    end
    @body.eyes = '#000000'
    @body.execute!(5)
  end

  def self.execute!
    new.execute!
  end
end

