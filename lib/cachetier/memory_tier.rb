require 'cachetier/tier'

module Cachetier
	class MemoryTier < Tier
	  
	  def initialize(ttl, high_watermark = nil, low_watermark = nil)
	  	super(ttl, high_watermark, low_watermark)

	  	@cache = {}
	  end

	  def get_val_and_expiration_time(key)
	  	val, expiration_time = @cache[key]
	  end

	  def reset(key)
	  	@cache.delete(key)
	  end

	  def size
	  	@cache.size
	  end

	  def expired?(key)
	  	val, expiration_time = @cache[key]
	  	return expiration_time < Time.now
	  end

    def keys
    	return @cache.keys
    end

	protected

	  def set(key, value, ttl)
	  	@cache[key] = [value, Time.now + ttl]
	  end

	end
end