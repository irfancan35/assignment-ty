# assignment-ty

Pip install:
pip install robotframework
pip install robotframework-requests
pip install robotframework-selenium2library
pip install robotframework-debuglibrary
OR
pip3 install -r requirements.txt

Brew Install:
brew install geckodriver
brew cask install chromedriver

Browser Options:
robot --variable BROWSER:chrome -d Results Tests/Trendyol.robot
robot --variable BROWSER:firefox -d Results Tests/Trendyol.robot
robot --variable BROWSER:safari -d Results Tests/Trendyol.robot
robot --variable BROWSER:headlesschrome -d Results Tests/Trendyol.robot
robot --variable BROWSER:headlessfirefox -d Results Tests/Trendyol.robot
