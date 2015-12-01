module UserAgentGenerator
  # :nodoc:
  class Application
    def initialize(argv)
      @options = parse_options(argv)

      @display = UserAgentGenerator::Display.new(@options)
      @logic   = UserAgentGenerator::Logic.new(@options)
      @output  = UserAgentGenerator::Output.new(@options)
    end

    def run
      agent_strings = @logic.run
      @display.render(@output.to_file(agent_strings))
    end

    def parse_options(argv)
      options = {}

      opt_parser = OptionParser.new do |opt|
        opt.banner = 'Usage: user_agent_generater [OPTIONS]'
        opt.separator ''
        opt.separator 'Options'

        opt.on('-w', '--windows', 'Use Windows OS') do
          options[:windows] = true
        end

        opt.on('-a', '--android', 'Use Android Mobile OS') do
          options[:android] = true
        end

        opt.on('-i', '--iOS', 'Use iOS Mobile OS') do
          options[:iOS] = true
        end

        opt.on('-c', '--chrome', 'Use Chrome browser') do
          options[:chrome] = true
        end

        opt.on('-f', '--firefox', 'Use Firefox browser') do
          options[:firefox] = true
        end

        opt.on('-s', '--safari', 'Use Safari browser Note: mobile only') do
          options[:safari] = true
        end

        opt.on('-v', '--version VERSION', 'Version number, REQUIRED') do |v|
          options[:version] = v
        end

        opt.on_tail('-h', '--help', 'Print this help!') do
          puts opt_parser
          exit
        end
      end

      opt_parser.parse!(argv)

      options
    end
  end
end
