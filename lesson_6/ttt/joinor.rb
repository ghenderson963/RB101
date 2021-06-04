require 'pry'

brd = [1,2,3,4,5]

def joinor(brd, conjunction = 'and')
  brd.each do |num|
    if brd.index(num) == brd.length - 2
      puts "#{conjunction} #{num} "
    else
      print "#{num}, "
    end
  end
end

print 'pick a number ' 
joinor(brd, 'or')