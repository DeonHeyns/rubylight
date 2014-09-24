require 'minitest/autorun'
require 'minitest/reporters'
require 'tiny_tds'
Minitest::Reporters.use!

class SqlServerTest < Minitest::Test

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_fail

stored_proc = <<PROC
;CREATE PROCEDURE proc_get_all_users AS
BEGIN
  SELECT * FROM [Security].[dbo].[t801_user]
END
PROC

    client = TinyTds::Client.new(:username => 'test_user',
                                 :password => 'password',
                                 :host => '127.0.0.1',
                                 :database => 'my_database')

    result = client.execute(stored_proc)
    result.each do |row|
      puts row
    end
    client.close
  end
end