require 'optparse'

module DatabaseRunner

  class Parameters

    attr_reader :params, :opt_parser

    def initialize
      @params = {}
      @opt_parser = OptionParser.new do |opt|
        opt.banner = 'Usage: database_runner COMMAND [OPTIONS]'
        opt.separator ''
        opt.separator 'Commands'
        opt.separator '     create: will create the database and run all scripts'
        opt.separator '     run:    will run all the scripts depending if they have run before or not'
        opt.separator '     drop:   will drop / delete the database'
        opt.separator ''
        opt.separator 'Options'

        opt.on('-h', '--host [HOST]', String, 'the IP address or machine name of where the database is running') do |host|
          @params[:host] = host
        end

        opt.on('-a', '--adapter [ADAPTER]', String, 'the adapter to use i.e postgres, mysql, sqlite') do |adapter|
          @params[:adapter] = adapter
        end

        opt.on('-e', '--encoding [ENCODING]', String,'the specific encoding to use') do |encoding|
          @params[:encoding] = encoding
        end

        opt.on('-s', '--poolsize [POOLSIZE]', String,'the size of the pool to use whilst running the scripts') do |poolsize|
          @params[:poolsize] = poolsize
        end

        opt.on('-u', '--username [USERNAME]', String,'username used to connect to the database') do |username|
          @params[:username] = username
        end

        opt.on('-p', '--password [PASSWORD]', String,'password of the user used to connect to the database') do |password|
          @params[:password] = password
        end

        opt.on_tail('-?', '--help', 'Show this message') do
          puts opt
          exit
        end

      end
    end

    def parse!(args)
      @opt_parser.parse! args
    end
  end

  class Runner

    attr_reader :parameters, :host, :adapter, :encoding, :poolsize, :username, :password

    def initialize(parameters = {})
      @parameters = parameters
      @host = parameters[:host]
      @adapter = parameters[:adapter]
      @encoding = parameters[:encoding]
      @poolsize = parameters[:poolsize]
      @username = parameters[:username]
      @password = parameters[:password]
    end
  end
end

#'create -h 127.0.0.1 -a postgres -e unicode -s 5 -u postgres -p password'.split(' ').each_with_index do |arg, idx|
#  ARGV[idx] = arg
#end

parameters = DatabaseRunner::Parameters.new
parameters.parse!(ARGV)

params = parameters.params

unless params.any?
  puts parameters.opt_parser
  exit 0
end

runner = DatabaseRunner::Runner.new(params)
puts runner
