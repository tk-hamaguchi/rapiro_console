module RapiroConsole
  class Action

    attr_reader :body, :left_eye, :right_eye

    def initialize(body: body, left_eye: left_eye, right_eye: right_eye)
      @body = body
      @left_eye = left_eye
      @right_eye = right_eye
    end

    def self.find_actions
      subclasses = []
      ObjectSpace.each_object(singleton_class) do |k|
        subclasses << k if k.superclass == self
      end
      subclasses
    end
  end
end
