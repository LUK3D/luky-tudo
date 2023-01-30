# lukytudoapp

A todo list project with Super Powers 🔥.

## Getting Started

- Clone the project
- In terminal run `flutter pub get` 
- Run the project

## Structure
This project is composed in two parts:
### Flutter Project 
You can find all the code related to flutter on the lib Folder

### Python project
Python was used to create the speech to text function and we use it as a child process on flutter app.

### Important Files and Directories
#### audio_files
The audio_files directory is where all the audio files are stored.
#### Config.txt
#### This is a configuration file where we inform the flutter app where the speech to text python app is located so we don't need to recompile the app if we change his location.


## Features:

|Name|State|
|-|-|
|Create a to-do item by text|✅|
|Create a to-do item by voice|✅|
|Create a to-do item with multiple audios (Record multiple times)|✅|
|If you inputted a to-do item by voice, you have to be able to play it back|✅|
|View a list of to-do items|✅|
|Update a to-do item|✅|
|Delete a to-do item|✅|
|Delete the audio files when the item is deleted|✅|
|Complete a to-do item|✅|
|Persist data so we can keep them even when closing the app|✅|
