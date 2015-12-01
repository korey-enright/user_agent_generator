module UserAgentGenerator
  # :nodoc:
  class Logic
    def initialize(options)
      @options = options
    end

    def run
      if @options[:windows]
        windows
      elsif @options[:android]
        android
      elsif @options[:iOS]
        iOS
      else
        ''
      end
    end

    def windows
      string = 'Windows / '
      string + browser
    end

    def android
      string = 'Android / '
      string + browser
    end

    def iOS
      string = 'iOS / '
      string + browser
    end

    def browser
      if @options[:chrome]
        chrome(@options[:version])
      elsif @options[:firefox]
        firefox(@options[:version])
      elsif @options[:safari]
        safari(@options[:version])
      else
        ''
      end
    end

    def chrome(version)
      string = "Chrome #{version[0, 2]}: Mozilla/5.0 () AppleWebKit/537.36 (KHTML, like Gecko) Chrome/#{version} Safari/537.36"
      os_index = string.index('()') + 1
      string = @options[:windows] ? string.insert(os_index, 'Windows NT 6.1; WOW64') : string
      string = @options[:android] ? string.insert(os_index, 'Linux; 4.4.2; Nexus 4 Build/KOT49H') : string
      if @options[:iOS]
        string.insert(os_index, 'iPad; CPU OS 7_0_4 like Mac OS X')
        mobile_index = (string.index('Safari') - 1)
        string.insert(mobile_index, ' Mobile')
      else
        string
      end
    end

    def firefox(version)
      fail ArgumentError.new('Firefox not compatible with iOS devices') if @options[:iOS]
      string = "Firefox #{version[0, 2]}: Mozilla/5.0 () Gecko/ Firefox/#{version}"
      os_index = string.index('()') + 1
      if @options[:windows]
        string = string.insert(os_index, "Windows NT 6.1; WOW64; rv:#{version[0, 2]}.0")
        gecko_index = string.index('Gecko/') + 7
        string.insert(gecko_index, '20100101')
      elsif @options[:android]
        string = string.insert(os_index, "Android; Mobile; rv:#{version[0, 2]}.0")
        gecko_index = string.index('Gecko/') + 7
        string.insert(gecko_index, "#{version}")
      else
        string
      end
    end

    def safari(version)
      fail ArgumentError.new('Safari not compatible with Windows') \
        if @options[:windows]
      fail ArgumentError.new('Safari not compatible with Android devices') \
        if @options[:android]
      "Safari #{version[0]} (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/#{version} Mobile/11B554a Safari/9537.53"
    end
  end
end
