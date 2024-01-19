import os, sys

def space_to_snake(inputstring):
    # Replace spaces with underscores for snake_case
    return inputstring.replace(' ', '_').lower()

def change_case(mypath):
    # Convert the given path to an absolute path
    abs_path_to_dir = os.path.abspath(mypath)

    if not os.path.exists(abs_path_to_dir):
        raise ValueError("The provided path does not exist")

    with os.scandir(abs_path_to_dir) as iter:
        dirs = []
        markdownfiles = []
        for entry in iter:
            if entry.is_dir():
                dirs.append(entry.path)
            if entry.is_file() and entry.name.endswith('.md'):
                markdownfiles.append(entry.path)
        for dir in dirs:
            change_case(dir)
        for file_path in markdownfiles:
            directory, filename = os.path.split(file_path)
            new_filename = space_to_snake(filename)
            new_path = os.path.join(directory, new_filename)
            os.rename(file_path, new_path)

def main():
    if len(sys.argv) > 1:
        path = sys.argv[1]
        change_case(path)
    else:
        print("Please provide a directory path")

if __name__ == '__main__':
    main()

