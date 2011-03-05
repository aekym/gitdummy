class ConfigTest < MiniTest::Unit::TestCase

  def test_user_name
    name = $repo.config['user.name']

    assert_match /^[A-Z]\w+ [A-Z]\w+$/, name,
      "Please correct your user.name configuration with e.g. `git config user.name 'John Doe'`.
`#{name}` not accepted."
  end

  def test_user_email
    email = $repo.config['user.email']

    assert_match /^[a-z]+\.[a-z]+@\w+\.\w+$/, email,
      "Please correct your user.email configuration with e.g. `git config user.email 'john.doe@example.com'`.
`#{email}` not accepted."
  end

  def test_default_tracking
    push_default = $repo.config['push.default']

    assert_equal 'tracking', push_default,
      "Please correct you push.default configuration with `git config push.default tracking`. `#{push_default} no accepted."
  end

end

