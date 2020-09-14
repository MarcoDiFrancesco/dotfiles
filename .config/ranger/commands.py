from __future__ import absolute_import, division, print_function

import os

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command
from ranger.core.loader import CommandLoader


class mount_hdd(Command):
    """:mount_hdd <filename>

    Mount hdd and cd into it.
    """

    def execute(self):
        self.fm.execute_command("~/scripts/hdd")
        self.fm.cd("/run/media/" + os.getenv("USER"))


class fzf_select(Command):
    """
    :fzf_select

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
    """:extract [<exported_file>]

    Extract marked files to current directory
    """

    def execute(self):
        cwd = self.fm.thisdir
        copied_files = cwd.get_selection()

        if not copied_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        one_file = copied_files[0]
        cwd = self.fm.thisdir
        extrat_to = cwd.path
        au_flags = ["-X", cwd.path]
        au_flags += self.line.split()[1:]
        au_flags += ["-e"]

        self.fm.copy_buffer.clear()
        self.fm.cut_buffer = False
        if len(copied_files) == 1:
            descr = "extracting: " + os.path.basename(one_file.path)
        else:
            descr = "extracting files from: " + os.path.basename(one_file.dirname)
        obj = CommandLoader(
            args=["aunpack"] + au_flags + [f.path for f in copied_files],
            descr=descr,
            read=True,
        )

        obj.signal_bind("after", refresh)
        self.fm.loader.add(obj)


class compress(Command):
    """:compress

    Compress selected files to current directory
    """

    def execute(self):
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        # au_flags = parts[1:]
        if self.arg(1):
            au_flags = parts[1:]
        else:
            au_flags = "gigi.zip"

        descr = "Compressing files in: " + os.path.basename(parts[1])

        obj = CommandLoader(
            args=["apack"] + au_flags
            # + [os.path.relpath(f.path, cwd.path) for f in marked_files],
            + [os.path.relpath(f.path, cwd.path) for f in marked_files],
            descr=descr,
            read=True,
        )

        obj.signal_bind("after", refresh)
        self.fm.loader.add(obj)

    def tab(self, tabnum):
        """ Complete with current folder name """

        extension = [".zip", ".tar.gz", ".rar", ".7z"]
        return [
            "compress " + os.path.basename(self.fm.thisdir.path) + ext
            for ext in extension
        ]
