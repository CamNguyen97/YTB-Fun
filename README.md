# YouTube Video Sharing Web App
## Introduction
This project is a web application built for sharing YouTube videos with real-time notifications. It provides users with the ability to register, login, share YouTube videos, and view a list of shared videos. For backend and full-stack applicants, there's a real-time notification system implemented using WebSockets and background jobs.

## Prerequisites
* Ruby (version 3.2.0)
* PostgreSQL
* Git
* Docker
* redis

## Installation & Configuration

Clone the repository:

```git clone https://github.com/CamNguyen97/YTB-Fun.git``` and ```cd YTB-Fun```

## Development config

Configure:
Get youtube `API_KEY_YTB` from: https://developers.google.com/youtube/v3 and add it to `docker-compose`

## Running the Application

1. Start the Rails server:
`docker compose up --build`

2. Access the application in a web browser:
Open your web browser and navigate to http://localhost:3000.

3. Running tests:

* Run unit tests:
 ```rails test```

* Run integration tests:```rails test:integration```

## Usage
* Register and login to the application.
* Share YouTube videos by pasting the video URL.
* View the list of shared videos.
* Receive real-time notifications for new video shares.

## Troubleshooting
If you encounter any issues during setup or usage, please refer to the error messages and check the troubleshooting section of the README.md file.

Ensure that all dependencies are correctly installed and configured according to the instructions provided.

Thank you for reviewing our YouTube Video Sharing Web App! If you have any questions or feedback, please don't hesitate to contact us.
