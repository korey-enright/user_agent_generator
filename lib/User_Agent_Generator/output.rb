module UserAgentGenerator
  # :nodoc:
  class Output
    PATH_TO_WORKING_DIRECTORY = Dir.pwd
    MESSAGE = "You can find the user agent strings in the path: \
      #{PATH_TO_WORKING_DIRECTORY}/data/"
    PATH = 'data/'
    FILENAME = 'user_agent_strings.txt'

    def initialize(options)
      @options = options
    end

    def to_file(agent_string)
      output_to_render = MESSAGE

      exists = File.exist?(PATH + FILENAME)
      file = exists ? append_to_file : create_new_file
      write_to_file(file, agent_string)

      output_to_render << FILENAME
    end

    def append_to_file
      File.open(PATH + FILENAME, 'a')
    end

    def create_new_file
      path = PATH
      unless File.directory?(Dir.pwd + path)
        FileUtils.mkdir_p(path)
      end

      path << FILENAME
      File.new(path, 'w')
    end

    def write_to_file(file, agent_string)
      file.puts(agent_string)
    end
  end
end
