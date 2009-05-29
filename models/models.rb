require 'bumble'

class Story
  include Bumble
  
  ds :title, :created_at
  
end

class Piece
  include Bumble
  
  ds :title, :created_at
  
end

class Author
  include Bumble
  
  ds :nick

end