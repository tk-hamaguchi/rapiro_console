class RapiroConsole::Action::Walk < RapiroConsole::Action
  COMMAND = %w(w walk)
  DESCRIPTION = 'Walking'

  def execute!
    loop do
    
      @body.right_foot_yaw   = { close: 80 }
      @body.right_foot_pitch = { open: 70 }
      @body.left_foot_yaw    = { open: 80 }
      @body.left_foot_pitch  = { close: 60 }
      @body.execute!(5)
      sleep 0.5
      
      @body.right_foot_yaw   = { close: 70 }
      @body.right_foot_pitch = { open: 90 }
      @body.left_foot_yaw    = { open: 70 }
      @body.left_foot_pitch  = { close: 90 }
      @body.execute!(5)
      sleep 0.5
    
      @body.right_foot_yaw   = { close: 70 }
      @body.right_foot_pitch = { close: 70 }
      @body.left_foot_yaw    = { open: 70 }
      @body.left_foot_pitch  = { open: 80 }
      @body.execute!(5)
      sleep 0.5
    
      @body.right_foot_yaw   = { open: 80 }
      @body.right_foot_pitch = { close: 60 }
      @body.left_foot_yaw    = { close: 80 }
      @body.left_foot_pitch  = { open: 70 }
      @body.execute!(5)
      sleep 0.5
    
      @body.right_foot_yaw   = { open: 70 }
      @body.right_foot_pitch = { close: 90 }
      @body.left_foot_yaw    = { close: 70 }
      @body.left_foot_pitch  = { open: 90 }
      @body.execute!(5)
      sleep 0.5
    
      @body.right_foot_yaw   = { open: 70 }
      @body.right_foot_pitch = { open: 80 }
      @body.left_foot_yaw    = { close: 70 }
      @body.left_foot_pitch  = { close: 70 }
      @body.execute!(5)
      sleep 0.5
    end
  rescue Interrupt
    @body.right_foot_yaw   = { open: 90 }
    @body.right_foot_pitch = { open: 90 }
    @body.left_foot_yaw    = { close: 90 }
    @body.left_foot_pitch  = { close: 90 }
    @body.execute!(5)
    sleep 0.5
  end
end

