# -*- encoding: utf-8 -*-

class ConfigTest < MiniTest::Unit::TestCase

  def test_user_name
    name = $repo.config['user.name'].force_encoding('utf-8')

    # load configurable regexp to test the user's email
    #
    regexp = Regexp.new($config['tests']['config']['user']['name_regexp'].force_encoding('utf-8'))

    assert_match regexp || /^\w+ \w+$/i, name,
      "Please correct your user.name configuration with e.g. `git config user.name 'John Doe'`. `#{name}` not accepted"
  end

  def test_user_email
    email = $repo.config['user.email'].force_encoding('utf-8')

    # load configurable regexp to test the user's email
    #
    regexp = Regexp.new($config['tests']['config']['user']['email_regexp'].force_encoding('utf-8'))

    assert_match regexp || /^[a-z]+\.[a-z]+@\w+\.\w+$/, email,
      "Please correct your user.email configuration with e.g. `git config user.email 'john.doe@example.com'`. `#{email}` not accepted"
  end

  def test_default_tracking
    push_default = $repo.config['push.default']

    assert_equal 'tracking', push_default,
      "Please correct you push.default configuration with `git config push.default tracking`. `#{push_default} no accepted."
  end

end

