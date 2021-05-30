echo "Installing xcodegen"
brew install xcodegen 

echo "Installing swiftlint"
brew install swiftlint 

echo "Generating project"
xcodegen generate -s ./project.yml