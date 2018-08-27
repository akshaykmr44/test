import  sys
import  os
filename = input("Enter the path of your file: ")
if os.path.isdir(filename):
    f = open(filename,'r+')
print(max(open(filename, 'r'), key=len))
print(len(max(open(filename, 'r'), key=len)))