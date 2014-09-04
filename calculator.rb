# make a calculator program

include Math

# calcultion functions
def add(a, b)
    a+b
end

def sub(a,b)
    a-b
end

def mult(a,b)
    a*b
end

def div(a,b)
    a/b
end

def exp(a,b)
    a**b
end

def sqrt(a)
    Math.sqrt(a)
end

def ask
    puts "What do you want to do? Choose +, -, *, /, ^, or sqrt"
    input = gets.chomp
    input
end

# makes it so user can enter nothing and it works as 0
def nilfix (n)
    if n=="nil"
        return 0
    else 
        return n
    end
end

# puts it all togehter
def calculate (op, a, b) 
    if op == "+"
        add(a,b)
    elsif op == "-"
        sub(a,b)
    elsif op == "*"
        mult(a,b)
    elsif op == "/"
        if a%b != 0
            a = a.to_f
            b = b.to_f
        end
        div(a,b)
    elsif op == "^"
        exp(a,b)
    elsif op == "sqrt"
        sqrt(a)
    else 
        nil
    end
end

# array of symbols, global variable so that it's accessible everywhere
Symba = ["+", "-", "*", "/", "^", "sqrt"]
#Numbers = ["", "0".."9"]

# checks if the user entered a meaningful symbol and prompts to enter again 
def inputValid (input)
        i=0
        while !(Symba.include?(input))
            puts "Input not valid! Enter again."
            input = ask
            i+=1
            if i==5
                puts "You're doing it wrong."
            exit
        end
    end
    return input
end

#This doesn't work right, so it is commented out:
#def numstr (n)
#   while !(Numbers.include?(n[0]))
#       puts "That's not a number! Enter again"
#       n = gets.chomp
#       return n
#    end
#end

# asks user if they want to continue calculating
def continue
    puts "Conintue calculating with result? Enter y or n."                                                                          
    choice = gets.chomp
    return choice
end

# main

puts "Calculate!"
input = ask 
input = inputValid(input)

puts "What is the first number?"
num1 = gets.chomp.to_i # remember gets = get string so we want to convert to an inwt
num1 = nilfix(num1)
#num1 = numstr(num1)

if input != "sqrt"
    puts "What is the second number?"
    num2 = gets.chomp.to_i
    num2 = nilfix(num2)
else 
    num2 = nil
end

answer = calculate(input, num1, num2)
puts "#{num1} #{input} #{num2} = #{answer}"

while continue == "y"
    total = answer
    input = ask
    input = inputValid(input)
    if input != "sqrt"
        puts "What's the second number?"
        newnum = gets.chomp.to_i
        newnum = nilfix(newnum)
    else
        newnum = nil
    end
    answer = calculate(input, total, newnum)
    puts "#{total} #{input} #{newnum} = #{answer}"
end
