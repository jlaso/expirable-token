require 'time'
require 'json'
require 'base64'
require 'uri'

class ExpirableToken

  attr_reader :extra
  attr_reader :id
  attr_reader :expire_on

  def initialize(id, extra, expire_on = nil)
    @id = id
    @extra = extra
    @created_on = Time.now.to_i
    if expire_on.nil?
      @expire_on = @created_on + 86400
    else
      @expire_on = expire_on
    end
    @diff = @expire_on - @created_on
  end

  def is_valid
    today = Time.now.to_i
    !@id.nil? && (@diff = (@expire_on - @created_on)) && (@expire_on > today)
  end

  def encode
    URI::encode(Base64.encode64(
      JSON.generate(
        {
          0 => @id,
          1 => @extra,
          2 => @diff,
          3 => @created_on,
          4 => @expire_on
        }
      )
    ).chomp.chomp('=').chomp('='))
  end

  def decode(token)
    a = JSON.parse(Base64.decode64(URI::decode(token)+"==\n"))
    @id = a['0']
    @extra = a['1']
    @diff = a['2']
    @created_on = a['3']
    @expire_on = a['4']
    is_valid
  end

  def self.from_token(token)
    instance = ExpirableToken.new(nil, nil)
    instance.decode(token)
    return instance
  end

end