# Overrides /usr/share/doc/ranger/config/commands.conf
# Compare with https://raw.githubusercontent.com/ranger/ranger/master/ranger/config/commands.py

from __future__ import absolute_import, division, print_function

import os

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command, command_alias_factory
from ranger.core.loader import CommandLoader


class mount_hdd(Command):
    """:mount_hdd <filename>

    Mount hdd and cd into it.
    """

    def execute(self):
        self.fm.execute_command("~/scripts/hdd")
        self.fm.cd("/run/media/" + os.getenv("USER"))


class fzf_select(Command):
    """:fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """

    def execute(self):
        import subprocess
        import os.path

        if self.quantifier:
            # match only directories
            command = "find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        else:
            # match files and directories
            command = "find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        fzf = self.fm.execute_command(
            command, universal_newlines=True, stdout=subprocess.PIPE
        )
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip("\n"))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)


class extract(Command):
    """:extract

    Extract marked files in directory with same filename
    but without extension
    """

    def execute(self):
        from pathlib import Path

        cwd = self.fm.thisdir
        original_path = cwd.path
        files = cwd.get_selection()

        if len(files) > 1:
            raise SyntaxError("Extract one file at a time")

        # atool package
        command = ["aunpack"]
        file = files[0]
        # /dir/file.txt
        file = Path(files[0].path)
        # /dir/file
        dest_dir = file.parent / file.stem
        if os.path.exists(dest_dir):
            raise FileExistsError(f"Directory '{file.stem}' already exists")
        command.append("-X")
        command.append(dest_dir)
        command.append(file)
        descr = "Extracting"
        obj = CommandLoader(
            args=command,
            descr=descr,
            read=True,
        )

        # Deselect files
        cwd.marked_items.clear()

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        obj.signal_bind("after", refresh)
        self.fm.loader.add(obj)


class compress(Command):
    """:compress <filename>

    Compress selected files to archive
    """

    def execute(self):
        cwd = self.fm.thisdir
        original_path = cwd.path
        marked_files = cwd.get_selection()
        # ["compress", "dest.zip"]
        args = self.line.split()
        if len(args) != 2:
            raise SyntaxError("Specify archive name with extension")
        # e.g. myfile.zip
        dest_name = args[1]

        descr = "Compressing files in: " + os.path.basename(dest_name)
        command = ["apack"]
        command.append(dest_name)
        command += [os.path.relpath(f.path, cwd.path) for f in marked_files]
        obj = CommandLoader(
            args=command,
            descr=descr,
            read=True,
        )

        # Deselect files
        cwd.marked_items.clear()

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        obj.signal_bind("after", refresh)
        self.fm.loader.add(obj)

    def tab(self, tabnum):
        """Complete with current folder name"""

        extension = [".zip", ".tar.gz", ".7z"]
        # From ':compress dest' take 'dest'
        new_name = self.args[1]
        # From 'new_name.z' to 'new_name'
        new_name = new_name.split(".")[0]
        return ["compress " + new_name + ext for ext in extension]
