require 'grit'
require 'minitest/unit'

module Gitdummy

  def self.start
    MiniTest::Unit.autorun

    $repo = Grit::Repo.new('.')

    test_dir = File.realpath('../lib/gitdummy/tests', File.dirname(__FILE__))

    Dir["#{test_dir}/**/*_test.rb"].each do |file|
      require file
    end
  end

end

