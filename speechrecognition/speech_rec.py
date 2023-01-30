import speech_recognition as sr
from datetime import datetime
# filename = "16-122828-0002.wav"

# initialize the recognizer
r = sr.Recognizer()


# # open the file
# with sr.AudioFile(filename) as source:
#     # listen for the data (load audio to memory)
#     audio_data = r.record(source)
#     # recognize (convert from speech to text)
#     text = r.recognize_google(audio_data)
#     print(text)

with sr.Microphone() as source:
    # read the audio data from the default microphone
    audio_data = r.record(source, duration=10)
    # Get the audio file
    # audio_data.get_raw_data()
    print("Recognizing...")
    # convert speech to text
    filename= 'audio_files/'+datetime.utcnow().strftime('%Y-%m-%d_%H-%M-%S')+".wav"
    with open(filename, 'wb') as f: 
        f.write(audio_data.get_wav_data())
    text = r.recognize_google(audio_data, language='en-US')
    print(text)
    print("FILENAME:"+filename)


