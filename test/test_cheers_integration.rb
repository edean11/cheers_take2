require 'minitest/autorun'

class TestCheersIntegration < MiniTest::Test

	def test_that_the_tests_run
		output = `./cheers`
		expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
		assert_equal expected, output
	end
end