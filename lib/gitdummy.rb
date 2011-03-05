require 'grit'
require 'minitest/unit'
require 'thor'


module Gitdummy
  class Cli < Thor
    default_task :check

    def initialize(*args)
      super
      $repo = Grit::Repo.new('.')
    end

    desc 'check', 'Check your current git repository and configuration'
    method_options :'auto-fetch' => true
    def check
      system('git fetch') if options['auto-fetch']

      test_dir = File.realpath('../lib/gitdummy/tests', File.dirname(__FILE__))

      Dir["#{test_dir}/**/*_test.rb"].each do |file|
        require file
      end

      MiniTest::Unit.new.run
    end

  end
end

