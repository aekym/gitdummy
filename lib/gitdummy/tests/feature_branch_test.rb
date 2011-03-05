class FeatureBranchTest < MiniTest::Unit::TestCase

  def test_branch_of_origin_master
    head = $repo.head.commit
    origin_master_id = $repo.remotes.find{|r| r.name == 'origin/master'}.commit.id

    current = head
    found = false

    while !found && current do
      if current.id == origin_master_id
        found = true
      end

      current = current.parents.first
    end

    assert found, "Your current branch is outdated and needs a rebase to the origin/master branch with `git rebase origin/master`."
  end

end

