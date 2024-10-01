from distutils.dir_util import copy_tree
import os

def remove_file(source_dir=None, target_file=None, silent_fail=False):
    directory = f"{source_dir}/{target_file}"

    try:
        if os.path.exists(directory):
            os.remove(directory)
        elif (silent_fail == False):
            raise Exception("Path not found.")
    except:
        raise Exception("File could not be removed.")

def copy_dir(source_dir="", end_dir=""):

    paths = copy_tree(source_dir, end_dir)

    return paths

if (__name__ == "__main__"):
    remove_file(source_dir="build/@HATG", target_file="mod.cpp", silent_fail=True)

    pathsFirst = copy_dir(source_dir="hatg/cfg", end_dir="build/@HATG")