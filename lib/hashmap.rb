class HashMap

  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(@capacity) { [] } 
    @size = 0
  end


  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end


  def set(key, value)
    # Check if adding a new entry would exceed the load factor
    if @size.to_f / @capacity > @load_factor
      # Expand capacity and rehash
      new_capacity = @capacity * 2
      new_buckets = Array.new(new_capacity) { [] }

      @buckets.each do |bucket|
        bucket.each do |pair|
          new_index = hash(pair[:key]) % new_capacity
          new_buckets[new_index] << pair
        end
      end

      # Replace old buckets with new expanded ones
      @buckets = new_buckets
      @capacity = new_capacity
      
    end

    # Set key-value pair
    index = hash(key) % @capacity # Ensures bucket index is always in-bounds
    bucket = @buckets[index] # Retrieve the bucket at index

    #puts "Setting key: #{key}, value: #{value}, index: #{index}"  # Debugging line


    # Check if the key already exists
    bucket.each do |pair|
      if pair[:key] == key # If it exists...
        pair[:value] = value # ...update the value
        return
      end
    end

    # Append the new key-value pair if key doesn't exist
    bucket << { key: key, value: value }
    @size += 1
  end


  def get(key)
    @buckets.each do |bucket|
      bucket.each do |pair|
        if pair[:key] == key
         # puts "found key: #{key}, value: #{pair[:value]}" # debugging line
          return pair[:value]
        end
      end
    end

   # puts "key not found: #{key}" # debugging line
    return nil
  end


  def has?(key)
    @buckets.each do |bucket|
      bucket.each do |pair|
        if pair[:key] == key
          return true
        end
      end
    end

    return false
  end


  def remove(key)
    @buckets.each do |bucket|
      bucket.each_with_index do |pair, index|
        if pair[:key] == key
          removed_value = pair[:value]
          bucket.delete_at(index)
          @size -= 1
          return removed_value
        end
      end
    end
    return nil
  end


  def length
    @size
  end


  def clear
    @buckets = Array.new(@capacity) { [] }
    @size = 0
  end


  def keys
    keys_array = []
    @buckets.each do |bucket|
      bucket.each do |pair|
        keys_array << pair[:key]
      end
    end
    keys_array
  end


  def values
    values_array = []
    @buckets.each do |bucket|
      bucket.each do |pair|
        values_array << pair[:value]
      end
    end
    values_array
  end


  def entries
    entries_array = []
    @buckets.each do |bucket|
      bucket.each do |pair|
        entries_array << [pair[:key], pair[:value]]
      end
    end
    entries_array
  end
end

