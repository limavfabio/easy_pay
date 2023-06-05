# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `tailwindcss-rails` gem.
# Please instead update this file by running `bin/tapioca gem tailwindcss-rails`.

# source://tailwindcss-rails//lib/tailwindcss-rails.rb#1
module Tailwindcss; end

# source://tailwindcss-rails//lib/tailwindcss/commands.rb#4
module Tailwindcss::Commands
  class << self
    # source://tailwindcss-rails//lib/tailwindcss/commands.rb#75
    def compile_command(debug: T.unsafe(nil), **kwargs); end

    # source://tailwindcss-rails//lib/tailwindcss/commands.rb#24
    def executable(exe_path: T.unsafe(nil)); end

    # source://tailwindcss-rails//lib/tailwindcss/commands.rb#20
    def platform; end

    # @return [Boolean]
    #
    # source://tailwindcss-rails//lib/tailwindcss/commands.rb#94
    def rails_css_compressor?; end

    # source://tailwindcss-rails//lib/tailwindcss/commands.rb#86
    def watch_command(always: T.unsafe(nil), poll: T.unsafe(nil), **kwargs); end
  end
end

# source://tailwindcss-rails//lib/tailwindcss/commands.rb#5
Tailwindcss::Commands::DEFAULT_DIR = T.let(T.unsafe(nil), String)

# raised when TAILWINDCSS_INSTALL_DIR does not exist
#
# source://tailwindcss-rails//lib/tailwindcss/commands.rb#16
class Tailwindcss::Commands::DirectoryNotFoundException < ::StandardError; end

# raised when the tailwindcss executable could not be found where we expected it to be
#
# source://tailwindcss-rails//lib/tailwindcss/commands.rb#12
class Tailwindcss::Commands::ExecutableNotFoundException < ::StandardError; end

# raised when the host platform is not supported by upstream tailwindcss's binary releases
#
# source://tailwindcss-rails//lib/tailwindcss/commands.rb#8
class Tailwindcss::Commands::UnsupportedPlatformException < ::StandardError; end

# source://tailwindcss-rails//lib/tailwindcss/engine.rb#4
class Tailwindcss::Engine < ::Rails::Engine
  class << self
    # source://activesupport/7.0.5/lib/active_support/callbacks.rb#68
    def __callbacks; end
  end
end

# constants describing the upstream tailwindcss project
#
# source://tailwindcss-rails//lib/tailwindcss/upstream.rb#3
module Tailwindcss::Upstream; end

# rubygems platform name => upstream release filename
#
# source://tailwindcss-rails//lib/tailwindcss/upstream.rb#7
Tailwindcss::Upstream::NATIVE_PLATFORMS = T.let(T.unsafe(nil), Hash)

# source://tailwindcss-rails//lib/tailwindcss/upstream.rb#4
Tailwindcss::Upstream::VERSION = T.let(T.unsafe(nil), String)

# source://tailwindcss-rails//lib/tailwindcss/version.rb#2
Tailwindcss::VERSION = T.let(T.unsafe(nil), String)
