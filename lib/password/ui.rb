# frozen_string_literal: true

require 'optparse'
require 'clipboard'
require 'passgen'
require 'erb'

module Password
  class Html
    attr_reader :password

    def initialize(password)
      @password = password
    end

    def render
      b = binding
      # create and run templates, filling member data variables
      html = <<-HTML
        <!doctype html>
        <html>
          <head>
            <style type="text/css">
              h1 {
                text-align: center;
                font-size: 3.5em;
              }
            </style>
          </head>
          <body>
            <h1>
              <%= @password %>
            </h1>
          </body>
        </html>
      HTML
      ERB.new(html).result(b)
    end
  end

  class OptparseExample
    class ScriptOptions
      attr_accessor :verbose, :clipboard, :generate, :show, :symbols, :length

      def initialize
        self.verbose = false
        self.clipboard = true
        self.generate = true
        self.show = false
        self.symbols = true
        self.length = 30
      end

      def define_options(parser)
        parser.banner = "Usage: Password [options]"
        parser.separator ""
        parser.separator "Specific options:"

        # add additional options
        password_length_option(parser)

        boolean_verbose_option(parser)
        boolean_clipboard_option(parser)
        boolean_generate_option(parser)
        boolean_show_option(parser)
        boolean_symbols_option(parser)

        parser.separator ""
        parser.separator "Common options:"

        # No argument, shows at tail.  This will print an options summary.
        # Try it and see!
        parser.on_tail("-h", "--help", "Show this message") do
          puts parser
          exit
        end
        # Another typical switch to print the version.
        parser.on_tail("--version", "Show version") do
          puts Password::VERSION
          exit
        end
      end

      def password_length_option(parser)
        parser.on('-l LENGTH', '--length LENGTH', '[OPTIONAL] Password length', String) do |length|
          self.length = length
        end
      end

      def boolean_verbose_option(parser)
        # Boolean switch.
        parser.on("-v", "--[no-]verbose", "Run verbosely") do |v|
          self.verbose = v
        end
      end

      def boolean_symbols_option(parser)
        # Boolean switch.
        parser.on("-i", "--[no-]symbols", "Do not include symbols") do |i|
          self.symbols = i
        end
      end

      def boolean_generate_option(parser)
        # Boolean switch.
        parser.on("-v", "--[no-]generate", "Generate password") do |g|
          self.generate = g
        end
      end

      def boolean_clipboard_option(parser)
        # Boolean switch.
        parser.on("-c", "--[no-]clipboard", "Get the content from the clipboard") do |c|
          self.clipboard = c
        end
      end

      def boolean_show_option(parser)
        # Boolean switch.
        parser.on("-s", "--[no-]show", "Show the password in the current browser") do |s|
          self.show = s
        end
      end
    end

    #
    # Return a structure describing the options.
    #
    def parse(args)
      # The options specified on the command line will be collected in
      # *options*.
      @options = ScriptOptions.new
      @option_parser = OptionParser.new do |parser|
        @options.define_options(parser)
        parser.parse!(args)
      end
      @options
    end

    attr_reader :parser, :options, :option_parser
  end  # class OptparseExample

  class Ui
    def initialize
      example = OptparseExample.new
      @options = example.parse(ARGV)

      if !options.generate
        help(example.option_parser)
        exit(1)
      end
    end

    def convert
      @password = Passgen::generate({
        :length => options.length,
        :symbols => options.symbols,
        :lowercase => true,
        :uppercase => true,
        :digits => true
      })

      Clipboard.copy(password) if options.clipboard
      show_in_browser if options.show

      password
    end

    def show_in_browser
      File.open('generated_password.html', 'w') { |f| f.write(Html.new(password).render) }
    end

    def help(opts)
      puts(opts)
      puts("-------------------------------------------")
      puts("password --generate --no-symbol --length=10")
      puts("-------------------------------------------")
    end

    attr_reader :options, :password
  end
end
