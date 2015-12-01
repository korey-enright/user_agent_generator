module UserAgentGenerator
  # :nodoc:
  class Display
    def initialize(options)
      @options = options
    end

    def render(output_info)
      puts output_info
    end
  end
end
