
"""
A script that reads a filename and a number k from the command line
and prints the first k lines of the file.
"""
import argparse
import sys

def preview_file(filename, k):
    """Reads and prints the first k lines of a specified file."""
    if k <= 0:
        print(f"Error: Number of lines k must be a positive integer, but got: {k}", file=sys.stderr)
        return

    try:
        # Open in text mode, ignoring potential encoding errors for binary files.
        with open(filename, 'r', encoding='utf-8', errors='ignore') as f:
            print(f"--- Previewing '{filename}' as text ---")
            for i, line in enumerate(f):
                if i >= k:
                    break
                print(line, end='')

    except FileNotFoundError:
        print(f"Error: File '{filename}' not found.", file=sys.stderr)
    except Exception as e:
        print(f"An error occurred while reading the file: {e}", file=sys.stderr)


if __name__ == "__main__":
    # 1. Create ArgumentParser object
    parser = argparse.ArgumentParser(
        description="Reads and prints the first k lines of a file.",
        epilog="Example: python preview_data.py my_data.fvecs 10"
    )

    # 2. Add command-line arguments
    parser.add_argument("filename", help="The path to the file to read")
    parser.add_argument("k", type=int, help="The number of lines to read from the start of the file")

    # 3. Parse arguments
    args = parser.parse_args()

    # 4. Call the main function
    preview_file(args.filename, args.k)