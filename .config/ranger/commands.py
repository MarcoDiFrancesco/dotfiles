# Overrides /usr/share/doc/ranger/config/commands.conf
# Compare with https://raw.githubusercontent.com/ranger/ranger/master/ranger/config/commands.py

from __future__ import absolute_import, division, print_function

import os

from ranger.api.commands import Command
from ranger.core.loader import CommandLoader


class mount_hdd(Command):
    """:mount_hdd <filename>

    Mount hdd and cd into it.
    """

    def execute(self):
        self.fm.execute_command("~/scripts/hdd")
        self.fm.cd("/run/media/" + os.getenv("USER"))


class imgur_screenshot(Command):
    """:imgur_screenshot <filename>

    Upload image to Imgur
    """

    def execute(self):
        cwd = self.fm.thisdir
        original_path = cwd.path
        files = cwd.get_selection()
        assert len(files) == 1, "Extract one file at a time"
        command = ["imgur-screenshot", str(files[0])]
        descr = "Uploading to Imgur"
        obj = CommandLoader(
            args=command,
            descr=descr,
        )
        self.fm.loader.add(obj)


class backgroundremover(Command):
    """:backgroundremover <filename>

    Remove background from image
    """

    def execute(self):
        cwd = self.fm.thisdir
        original_path = cwd.path
        files = cwd.get_selection()
        assert len(files) == 1, "Extract one file at a time"
        # f"/home/marco/Documents/backgroundremover/.venv/bin/backgroundremover -i '{str(files[0])}' -o '{str(files[0])}'",
        command = ["backgroundremover", str(files[0])]
        descr = "Removing background from image"
        obj = CommandLoader(
            args=command,
            descr=descr,
        )
        self.fm.loader.add(obj)


class fzf_select(Command):
    """:fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """

    def execute(self):
        import os.path
        import subprocess

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
        # e.g. /dir/file.txt
        f = Path(files[0].path)
        # Check file size
        max_size = 100 * 1024 * 1024 # 100MB
        if Path(f).stat().st_size > max_size:
            raise SyntaxError("File too large for Ranger, use terminal or Dolphin instead")
        # e.g. /dir/file
        dest_dir = f.parent / f.stem
        if dest_dir.exists():
            raise FileExistsError(f"Directory '{f.stem}' already exists")
        # aunpack -X requires existing directory
        dest_dir.mkdir()
        command.append("-X")
        command.append(str(dest_dir))
        command.append(str(f))
        obj = CommandLoader(
            args=command,
            descr="Extracting",
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
        obj = CommandLoader(args=command, descr=descr, silent=True)

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
