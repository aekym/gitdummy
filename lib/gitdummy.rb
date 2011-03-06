# -*- encoding: utf-8 -*-
#
require 'grit'
require 'minitest/unit'
require 'thor'
require 'yaml'


module Gitdummy
  class Cli < Thor
    default_task :check

    CONFIG_FILE = '.gitdummyrc'

    def initialize(*args)
      super

      $repo = Grit::Repo.new('.')
      $config = YAML.load_file(CONFIG_FILE) if File.readable?(CONFIG_FILE)
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

