@words = Hash.new
@key_root = Hash.new

def insert_word(word, desc)
  word.downcase!
  word.delete!(",")
  word.delete!(")")
  word.delete!("(")
  word.delete!("[")
  word.delete!("]")
  
  @words[word] = Array.new() if !@words[word]
  @words[word] << desc #if (!@words[word].index(order_number))

end

# Build word lookup structure for word suggestions
def build_word_lookup
  @words.keys.each do |word|
    build_word_iter(@key_root, word)
  end
end

def build_word_iter(node, word)
  char = word[0]
  node[char] = Hash.new if !node[char]
  
  if (word.length > 1)
    build_word_iter(node[char], word[1..-1])
  else
    # indicate end of word and return the node
    node[char]["^"] = nil
  end
end


# Test of getting suggested words
def get_suggestions(word)
  starting_node = @key_root
  
  word.chars do |ch|
    starting_node = starting_node[ch]
    if (starting_node == nil)
      puts "no match"
      return
    end
  end

  show_suggestions(word, starting_node)
end

def show_suggestions(word, node)
  node.keys.each do |ch|
    if (ch == "^")
      puts word
      @words[word].each do |desc|
        puts desc
      end
      puts
    else
      show_suggestions(word+ch, node[ch])
    end
  end
end

start_time = Time.now
# Read the file and build the look up data structure
file = File.open("icd-codes.txt", "r") do |file|
  while line = file.gets
    
    order_number = line[0..4]
    icd_10_code = line[6..12]
    is_header = line[14]
    short_desc = line[16..75]
    long_desc = line[77..376]
    
    short_desc.split.each {|word| insert_word(word, "#{icd_10_code} : #{short_desc}")}
    puts "processing: #{order_number}"
  end
end


# Build word suggestion data structure
puts "Building word index"
build_word_lookup
puts "#{@words.count} words in the list"
#puts @key_root
end_time = Time.now

puts end_time - start_time


# Test the data structure
loop do
  puts "============================================================"
  puts "Enter word to get suggestions:"
  query = gets
  puts
  query.chomp!
  query.downcase!
  #query.split.each {|word| puts @words[word]}
  get_suggestions(query)

end  





