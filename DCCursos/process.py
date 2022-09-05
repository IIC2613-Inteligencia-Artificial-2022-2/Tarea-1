import sys
import pprint
import json


def get_values(text):
    init = text.find("(") + 1
    end = text.find(")")
    text_list = text[init:end].split(",")
    return tuple(list(text_list))


lines = sys.stdin.readlines()

if 'OPTIMUM FOUND\n' in lines:
    sol_init_index = lines.index('OPTIMUM FOUND\n') - 2
else:
    sol_init_index = 4
atoms = lines[sol_init_index].split(" ")

corequisite = list(map(lambda x: get_values(x), list(
    filter(lambda x: "corequisite" in x, atoms))))
course_on = list(map(lambda x: get_values(x), list(
    filter(lambda x: "course_on" in x, atoms))))
prerequisite = list(map(lambda x: get_values(x), list(
    filter(lambda x: "prerequisite" in x, atoms))))
dictates_on = list(map(lambda x: get_values(x), list(
    filter(lambda x: "dictates_on" in x, atoms))))
# has_credits = dict(map(lambda x: get_values(x), list(
#    filter(lambda x: "has_credits" in x, atoms))))
approved_at = list(map(lambda x: get_values(x), list(
    filter(lambda x: "approved_at" in x, atoms))))

last_semester = int(max(course_on, key=lambda tup: int(tup[1]))[1])

planner = [[] for i in range(last_semester)]

for course, semes in approved_at:
    course = {
        "name": course,
        # "credits": int(has_credits[course]),
        "prerequisites": [i[0] for i in filter(lambda x: x[1] == course, prerequisite)],
        "corequisites": [i[0] for i in filter(lambda x: x[1] == course, corequisite)],
        "dictates": [int(i[1]) for i in filter(lambda x: x[0] == course, dictates_on)],
        "approved": True
    }
    planner[int(semes) - 1].append(course)

for course, semes in course_on:
    course = {
        "name": course,
        # "credits": int(has_credits[course]),
        "prerequisites": [i[0] for i in filter(lambda x: x[1] == course, prerequisite)],
        "corequisites": [i[0] for i in filter(lambda x: x[1] == course, corequisite)],
        "dictates": [int(i[1]) for i in filter(lambda x: x[0] == course, dictates_on)],
        "approved": False
    }

    planner[int(semes) - 1].append(course)

# save to json

file_name = "planner.json"

if sys.argv[-2] == "-o":
    file_name = sys.argv[-1]

with open(file_name, 'w') as outfile:
    json.dump(planner, outfile, indent=4)
