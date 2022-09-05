
FILE = "output.txt"

class Answer:
    
    def __init__(self):
        self.range_x = 0
        self.range_y = 0
        self.bound = 0
        self.shelves = []
        self.obstacles = []
        self.robots = []
        self.boxes = []
        self.water_cells = []
        self.floats = []
        self.portals = []

    def write_file(self):
        with open(FILE, "w") as output:
            output.write(f"{self.range_x},{self.range_y}\n")
            output.write(f"{self.bound}\n")
            
            for shelve in self.shelves:
                output.write(f"E,{shelve[0]},{shelve[1]}\n")
            for obstacle in self.obstacles:
                output.write(f"O,{obstacle[0]},{obstacle[1]}\n")
            for water in self.water_cells:
                output.write(f"W,{water[0]},{water[1]}\n")
            self.robots.sort(key=lambda x: x[3])
            for robot in self.robots:
                output.write(f"R,{robot[0]},{robot[1]},{robot[2]},{robot[3]}\n")
            self.boxes.sort(key=lambda x: x[4])
            for box in self.boxes:
                output.write(f"C,{box[0]},{box[1]},{box[2]},{box[3]},{box[4]}\n")
            for float in self.floats:
                output.write(f"F,{float[0]},{float[1]},{float[2]},{float[3]},{float[4]}\n")
            for portal in self.portals:
                output.write(f"Pin,{portal[0]},{portal[1]}\n")
                output.write(f"Pout,{portal[2]},{portal[3]}\n")
                
def get_number(text):
    init = text.find("(") + 1
    end = text.find(")")
    return int(text[init:end])

def get_numbers(text):
    init = text.find("(") + 1
    end = text.find(")")
    text_list = text[init:end].split(",")
    return tuple(list(map(int, text_list)))
from gettext import find
import sys

answer = Answer()
lines = sys.stdin.readlines()
# 
if 'OPTIMUM FOUND\n' in lines:
    sol_init_index = lines.index('OPTIMUM FOUND\n') - 2
else:
    sol_init_index = 4
atoms = lines[sol_init_index].split(" ")

answer = Answer()

answer.range_x = max(map(lambda x: get_number(x), list(filter(lambda x: "rangeX" in x, atoms))))
answer.range_y = max(map(lambda x: get_number(x), list(filter(lambda x: "rangeY" in x, atoms))))
answer.bound = max(map(lambda x: get_number(x), list(filter(lambda x: "time" in x, atoms))))
answer.shelves = list(map(lambda x: get_numbers(x), list(filter(lambda x: "goal" in x, atoms))))
answer.obstacles = list(map(lambda x: get_numbers(x), list(filter(lambda x: "obstacle" in x, atoms))))
answer.water_cells = list(map(lambda x: get_numbers(x), list(filter(lambda x: "water" in x, atoms))))
answer.robots = list(map(lambda x: get_numbers(x), list(filter(lambda x: "robotOn" in x, atoms))))
answer.boxes = list(map(lambda x: get_numbers(x), list(filter(lambda x: "boxOn(" in x, atoms))))
answer.floats = list(map(lambda x: get_numbers(x), list(filter(lambda x: "floatOn(" in x, atoms))))
answer.portals = list(map(lambda x: get_numbers(x), list(filter(lambda x: "portal" in x, atoms))))

answer.write_file()