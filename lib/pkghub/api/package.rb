require 'net/http'
require 'net/https'
require 'uri'
require 'net/http/post/multipart'


module Pkghub
  module API

    class Package

      def initialize(options)

        # Validate options
        missing_options = [:path, :distro].reject do |option|
          options.has_key?(option)
        end

        if missing_options.size > 0
          raise "Missing options: #{missing_options.join(", ")}"
        end

        # Default to making package active if not told otherwise
        options[:active] = true if options[:active].nil?

        # Check file is there
        @path = options[:path]
        @distro = options[:distro]
        raise "Couldn't find file #{@path}" unless File.exists?(@path)

      end

      # Upload file to pkghub.io

      def upload(project, token)

        uri = URI.parse("https://pkghub.io/api/v1/upload")
        n = Net::HTTP.new(uri.host, uri.port)
        n.use_ssl = true

        File.open(@path) do |package_file|
          req = Net::HTTP::Post::Multipart.new uri.path,
                "token"   => token,
                "project" => project,
                "distro"  => @distro,
                "file"    => UploadIO.new(package_file, "application/x-deb", File.basename(@path))

          res = n.start do |http|
            http.request(req) 
          end

          if res.code == "200"
            raise "Error uploading to pkghub.io API, code: #{res.code} body: #{res.body}"
          else
            puts "Success"
          end
        end

      end

    end

  end
end
