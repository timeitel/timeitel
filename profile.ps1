Set-Location C:\Users\Tim.Eitel\source\repos
#Import-Module PowerLine

# Dracula readline configuration. Requires version 2.0, if you have 1.2 convert to `Set-PSReadlineOption -TokenType`
#Set-PSReadlineOption -Color @{
#    "Command" = [ConsoleColor]::Green
#    "Parameter" = [ConsoleColor]::Gray
#    "Operator" = [ConsoleColor]::Magenta
#    "Variable" = [ConsoleColor]::White
#    "String" = [ConsoleColor]::Yellow
#    "Number" = [ConsoleColor]::Blue
#    "Type" = [ConsoleColor]::Cyan
#    "Comment" = [ConsoleColor]::DarkCyan
#}
# Dracula Prompt Configuration
#Import-Module posh-git
#$GitPromptSettings.DefaultPromptPrefix.Text = "$([char]0x2192) " # arrow unicode symbol
#$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::Green
#$GitPromptSettings.DefaultPromptPath.ForegroundColor =[ConsoleColor]::Cyan
#$GitPromptSettings.DefaultPromptSuffix.Text = "$([char]0x203A) " # chevron unicode symbol
#$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = [ConsoleColor]::Magenta
# Dracula Git Status Configuration
#$GitPromptSettings.BeforeStatus.ForegroundColor = [ConsoleColor]::Blue
#$GitPromptSettings.BranchColor.ForegroundColor = [ConsoleColor]::Blue
#$GitPromptSettings.AfterStatus.ForegroundColor = [ConsoleColor]::Blue

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Avit

# Edit prompt
function Write-BranchName () {
    try {
        $branch = git rev-parse --abbrev-ref HEAD

        if ($branch -eq "HEAD") {
            # we're probably in detached HEAD state, so print the SHA
            $branch = git rev-parse --short HEAD
            Write-Host " [$branch]" -ForegroundColor "red"
        }
        else {
            # we're on an actual branch, so print it
            Write-Host " [$branch]" -ForegroundColor "blue"
        }
    } catch {
        # we'll end up here if we're in a newly initiated git repo
        Write-Host " (no branches yet)" -ForegroundColor "yellow"
    }
}

function prompt {
    $base = ""
    #$path = "$($executionContext.SessionState.Path.CurrentLocation)"
    #Try shortening current path
    $dirSep = [IO.Path]::DirectorySeparatorChar
    $pathComponents = $PWD.Path.Split($dirSep)
    $displayPath = if ($pathComponents.Count -le 3) {
    $PWD.Path
    } else {
    '~{0}{1}' -f $dirSep, ($pathComponents[-2,-1] -join $dirSep)
    }
    

    #End of shortening display path


    $userPrompt = "$('>' * ($nestedPromptLevel + 1)) "

    Write-Host "`n$base" -NoNewline

    if (Test-Path .git) {
        Write-Host $displayPath -NoNewline -ForegroundColor "green"
        Write-BranchName
    }
    else {
        # we're not in a repo so don't bother displaying branch name/sha
        Write-Host $displayPath -ForegroundColor "green"
    }

    return $userPrompt
}

#Function to quickly view powershell profile
function Get-PowerShellProfile { & notepad $profile $args }
New-Alias -Name np -Value Get-PowerShellProfile -Force -Option AllScope

#PowerShell function for opening folder
function Open-Folder { & Invoke-Item $args }
New-Alias -Name ii -Value Open-Folder -Force -Option AllScope

#PowerShell function for opening folder
function Open-inCode { & code $args }
New-Alias -Name c -Value Open-inCode -Force -Option AllScope


#PowerShell functions and aliases for Git
function Get-GitStatus { & git status -sb $args }
New-Alias -Name gs -Value Get-GitStatus -Force -Option AllScope

function Get-GitCommit { & git commit -m $args }
New-Alias -Name gc -Value Get-GitCommit -Force -Option AllScope

function Get-GitAdd { & git add $args }
New-Alias -Name ga -Value Get-GitAdd -Force -Option AllScope

function Get-GitAddAll { & git add . $args }
New-Alias -Name gaa -Value Get-GitAddAll -Force -Option AllScope

function Get-GitTree { & git log --graph --oneline --decorate $args }
New-Alias -Name gl -Value Get-GitTree -Force -Option AllScope

function Get-GitPush { & git push $args }
New-Alias -Name gps -Value Get-GitPush -Force -Option AllScope

function Get-GitPull { & git pull $args }
New-Alias -Name gpl -Value Get-GitPull -Force -Option AllScope

function Get-GitFetch { & git fetch $args }
New-Alias -Name gf -Value Get-GitFetch -Force -Option AllScope

function Get-GitCheckout { & git checkout $args }
New-Alias -Name gco -Value Get-GitCheckout -Force -Option AllScope

function Get-GitBranch { & git branch $args }
New-Alias -Name gb -Value Get-GitBranch -Force -Option AllScope

function Get-GitRemote { & git remote -v $args }
New-Alias -Name gr -Value Get-GitRemote -Force -Option AllScope

function Get-GitUnstage { & git reset $args }
New-Alias -Name gu -Value Get-GitUnstage -Force -Option AllScope

function Get-GitDiff { & git diff $args }
New-Alias -Name gd -Value Get-GitDiff -Force -Option AllScope

function Get-GitDiffTool { & git difftool $args }
New-Alias -Name gdt -Value Get-GitDiffTool -Force -Option AllScope

function Set-WindowTitle {
    $host.UI.RawUI.WindowTitle = [char]::ConvertFromUtf32(0x000026A1) + " " + [string]::Join("", $args)
}
Set-Alias -name "t" -value Set-WindowTitle