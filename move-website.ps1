# Create new directory for website
$newPath = "c:\Users\Bensi\Documents\GitHub\bensiegils"
New-Item -ItemType Directory -Path $newPath -Force

# Copy website files, excluding Git-related items
Get-ChildItem -Path "." -Exclude @(".git", ".github", ".gitignore") | 
Copy-Item -Destination $newPath -Recurse -Force

# Navigate to new directory
Set-Location $newPath

# Initialize Git
git init
git add .
git commit -m "Initial commit"

# Create required Hugo directories if they don't exist
$hugoDirs = @("archetypes", "content", "layouts", "static")
foreach ($dir in $hugoDirs) {
    New-Item -ItemType Directory -Path (Join-Path $newPath $dir) -Force
}

Write-Host "Website files have been copied to: $newPath"
Write-Host "Git has been initialized in the new directory"
Write-Host "Hugo directories have been created"
Write-Host ""
Write-Host "Next steps:"
Write-Host "1. Create a new repository on GitHub"
Write-Host "2. Link and push to your new repository using:"
Write-Host "   git remote add origin <your-new-repo-url>"
Write-Host "   git push -u origin main"
Write-Host "3. Run 'hugo serve' to start your local server"
