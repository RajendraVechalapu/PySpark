#pip install moviepy librosa

import os
import moviepy.editor as mp
import librosa
import numpy as np

def has_voice(audio_file):
    y, sr = librosa.load(audio_file)
    # Use librosa to detect if there is voice
    return np.max(librosa.feature.rms(y=y)) > 0.01

def process_last_video_in_folder(folder_path):
    # Get a list of all files in the folder
    files = os.listdir(folder_path)
    # Filter only video files
    video_files = [f for f in files if f.endswith('.mp4')]
    if not video_files:
        print("No video files found in the folder.")
        return

    # Sort video files based on creation time
    video_files.sort(key=lambda x: os.path.getctime(os.path.join(folder_path, x)))

    # Select the last video file (most recently created)
    last_video_file = os.path.join(folder_path, video_files[-1])

    print(f"Last Video File"+ last_video_file)

    # Extract audio from the last video
    process_video(last_video_file)

    # Open the processed video file
    os.startfile(last_video_file)

def process_video(input_video):
    # Extract audio from the video
    video = mp.VideoFileClip(input_video)
    audio = video.audio

    # Save the audio to a temporary file
    temp_audio_file = "temp_audio.wav"
    audio.write_audiofile(temp_audio_file, codec='pcm_s16le')

    # Check if the audio contains voice
    if not has_voice(temp_audio_file):
        # If there is no voice, remove the video
        print("No voice detected, removing video:", input_video)
        os.remove(input_video)

    # Clean up temporary files
    audio.close()
    video.close()
    os.remove(temp_audio_file)

# Example usage
folder_path = "D:\\ApowerRECData"
process_last_video_in_folder(folder_path)
