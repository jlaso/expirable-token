require 'test/unit'
require 'expirable_token'

class ExpirableTokenTest < Test::Unit::TestCase
  def test_encode_decode
    test_token = ExpirableToken.new('1234', nil)
    assert(test_token.is_valid, 'token is not valid')
    token = test_token.encode
    assert(!token.nil?)
    new_token = ExpirableToken.from_token(token)
    assert_equal('1234', new_token.id)
    assert(new_token.extra.nil?)
  end

  def test_extra
    test_token = ExpirableToken.new('abcd', [1,2,3,'Hi'])
    assert(test_token.is_valid, 'token is not valid')
    token = test_token.encode
    assert(!token.nil?)
    new_token = ExpirableToken.from_token(token)
    assert_equal('abcd', new_token.id)
    assert_equal([1,2,3,'Hi'], new_token.extra)
  end
end
