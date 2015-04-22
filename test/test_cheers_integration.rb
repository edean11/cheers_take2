require_relative 'helper'

class TestCheersIntegration < MiniTest::Test

	def test_help_message
		output = `./cheers`
		expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
		assert_equal expected, output
	end

	#############################
	####### One Argument ########
	#############################

	def test_one_argument_with_valid_name
		output = `./cheers Abby`
		expected = <<EOS
Give me an...A!
Give me a...B!
Give me a...B!
Give me a...Y!
Abby's just GRAND!
I would wish you a Happy Birthday, if only i knew when that was!
EOS
		assert_equal expected, output
	end

	def test_one_argument_with_birthday_instead_of_name
		output = `./cheers 08/25`
		expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
		assert_equal expected, output
	end

	def test_one_argument_all_non_word
		output = `./cheers !*#`
		expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
		assert_equal expected, output
	end

	def test_empty_string_argument
		output = `./cheers  `
		expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
		assert_equal expected, output
	end

	#############################
	####### Two Arguments #######
	#############################

	def test_two_arguments_name_monthname
		output = `./cheers Abby August/25`
		expected = <<EOS
Give me an...A!
Give me a...B!
Give me a...B!
Give me a...Y!
Abby's just GRAND!

Awesome! Your birthday is in 125 days! Happy Birthday in advance!
EOS
		assert_equal expected, output
	end

	def test_two_invalid_arguments
		output = `./cheers #$s ##%$`
		expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
		assert_equal expected, output
	end

	def test_two_valid_arguments
		output = `./cheers Abby 08/25`
		expected = <<EOS
Give me an...A!
Give me a...B!
Give me a...B!
Give me a...Y!
Abby's just GRAND!

Awesome! Your birthday is in 125 days! Happy Birthday in advance!
EOS
		assert_equal expected, output
	end

	def test_valid_invalid_arguments
		output = `./cheers Abby Ja3n$r08`
		expected = <<EOS
Give me an...A!
Give me a...B!
Give me a...B!
Give me a...Y!
Abby's just GRAND!

I couldn't understand that. Could you give that to me in mm/dd format?
EOS
		assert_equal expected, output
	end

	def test_invalid_valid_arguments
		output = `./cheers Ab#b%y 08/12`
		expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
		assert_equal expected, output
	end

	def test_hyphen_name
		output = `./cheers Abby-Anne 08/25`
		expected = <<EOS
Give me an...A!
Give me a...B!
Give me a...B!
Give me a...Y!
Give me an...A!
Give me an...N!
Give me an...N!
Give me an...E!
Abby-Anne's just GRAND!

Awesome! Your birthday is in 125 days! Happy Birthday in advance!
EOS
		assert_equal expected, output
	end

	def test_space_name
		output = `./cheers Abby Anne 08/25`
		expected = <<EOS
Give me an...A!
Give me a...B!
Give me a...B!
Give me a...Y!
Give me an...A!
Give me an...N!
Give me an...N!
Give me an...E!
Abby Anne's just GRAND!

Awesome! Your birthday is in 125 days! Happy Birthday in advance!
EOS
		assert_equal expected, output
	end

	def test_is_birthday
		output = `./cheers Abby Anne 04/22`
		expected = <<EOS
Give me an...A!
Give me a...B!
Give me a...B!
Give me a...Y!
Give me an...A!
Give me an...N!
Give me an...N!
Give me an...E!
Abby Anne's just GRAND!

Happy Birthday!
EOS
		assert_equal expected, output
	end

	#############################
	###### Three Arguments ######
	#############################

	def test_three_arguments
		output = `./cheers Abby 08/25 hjdskada`
		expected = <<EOS
Give me an...A!
Give me a...B!
Give me a...B!
Give me a...Y!
Abby's just GRAND!

Awesome! Your birthday is in 125 days! Happy Birthday in advance!
EOS
		assert_equal expected, output
	end
end