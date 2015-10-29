#This program implements a caesar cypher. A user imputs text and the program adds three characters to each letter.

puts "Enter some text"
text = gets.chomp

result = [] #Will push the converted string to this array
encrypt = 3 #Add three characters to the 'text' string

text.each_char do |letter|
    new_letter = letter.ord + encrypt #Convert each letter to ASCII and add 3
    if letter == " "
        puts " " #Dont add 3 for empty spaces
    elsif new_letter > 122 || (new_letter > 90 && new_letter < 97)#Accounts for characters outside of 'A_Z' and 'a-z'
        letter = (new_letter - 26).chr 
    else
        letter = new_letter.chr 
    end
    
    result << letter #Push to the 'result' array
end

puts result.join