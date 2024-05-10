from pytube import YouTube
import os
import cv2

def download_video(url, output_path):
    yt = YouTube(url)
    stream = yt.streams.filter(file_extension='mp4').first()
    stream.download(output_path=output_path)
    return stream.default_filename

def extract_frames(video_path, output_folder):
    cap = cv2.VideoCapture(video_path)
    frame_count = 0

    while True:
        success, frame = cap.read()
        if not success:
            break

        frame_path = os.path.join(output_folder, f"frame_{frame_count}.jpg")
        cv2.imwrite(frame_path, frame, [int(cv2.IMWRITE_JPEG_QUALITY), 100])  # Ensure maximum quality
        print(f"Frame {frame_count} saved")

        frame_count += 1

    cap.release()

# Example usage
url = "https://www.youtube.com/watch?v=WSorSPJogEA"  # Replace with your YouTube video URL
output_folder = "D:/ApowerRECData/Import"  # Change this to your desired output folder

# Delete all files within the output folder before processing
for file in os.listdir(output_folder):
    file_path = os.path.join(output_folder, file)
    try:
        if os.path.isfile(file_path):
            os.unlink(file_path)
    except Exception as e:
        print(f"Failed to delete {file_path}. Reason: {e}")

if not os.path.exists(output_folder):
    os.makedirs(output_folder)

video_filename = download_video(url, output_folder)
video_path = os.path.join(output_folder, video_filename)
print("Video Path:" + video_path)
extract_frames(video_path, output_folder)
