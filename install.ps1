# Read the MATLAB path definition file, and add lines immediately before the
# default MATLAB paths.

## Helper Functions
function pauseQuit
{
    # If running in the console, wait for input before closing.
    if ($Host.Name -eq "ConsoleHost") {
        write-host ""
        write-host "Press any key to continue..."
        $Host.UI.RawUI.FlushInputBuffer()
        $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") > $null
    }
    exit
}

## Make directories
$devdir = join-path $HOME dev
$toolsdir = join-path $devdir tools
mkdir $devdir
mkdir $toolsdir


## Main Program
$dir = get-item (split-path -parent $MyInvocation.MyCommand.Path)
$files = @("bash_profile","bashrc","bash_aliases","inputrc","ctags","gitconfig","ghci", "vimrc", "vim")
$olddir = join-path $HOME .dotfiles_old

# create dotfiles_old in home dir
mkdir $olddir -Force > null

# move any existing dotfiles in homedir to dotfiles_old directory, then create 
# symlinks from the homedir to any files in the ~/.dotfiles directory specified 
# in $files
write-host "Moving any existing dotfiles from $HOME to $olddir"
foreach ($file in $files) {
    if (test-path $HOME\.$file) {
        move-item $HOME\.$file $olddir
    }
}

# copy files to directories
write-host "copying files.."
# cp $dir\windows\ConEmu.xml $toolsdir

# symlink files
write-host "symlinking dotfiles"
# cmd /c mklink "$HOME\filename" "$dir\pathtofile"
cmd /c mklink "$HOME\.gitconfig" "$dir\git\.gitconfig"
cmd /c mklink "$HOME\.vimrc" "$dir\vim\.vimrc"
cmd /c mklink "$HOME\.vim" "$dir\vim\.vim"
# cmd /c mklink "$HOME\.bashrc" "$dir\windows\.bashrc"
cmd /c mklink "$toolsdir\ConEmu.xml" "$dir\windows\ConEmu.xml"

#foreach ($file in $files) {
#    cmd /c mklink "$HOME\.$file" "$dir\$file"
#}

## Extra installs for Windows-specific files
# native ghci uses %APPDATA%/ghc/ghci.conf instead of ~/.ghci
# cmd /c mklink "$env:APPDATA\ghc\ghci.conf" "$dir\ghci"
# ConEmu config goes in %APPDATA%
# cmd /c mklink "$env:APPDATA\ConEmu.xml" "$dir\windows\ConEmu.xml"

write-host "Done."
pauseQuit
