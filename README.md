# 🎬 Movies App

Movies App is a mobile application built with **Flutter** that allows users to browse, search, and discover movies.  
It utilizes **The Movie Database (TMDB) API** to fetch a wide range of movie data and presents them in a clean, elegant, and responsive interface.

![image_alt](https://github.com/AyaNasserEzat/movie_app/blob/2c732b8a44c5e4df0724b4292c34109b90867e61/app_screenshots/movie%20app.jpeg)

---

## ✨ Features

- **Dynamic Home Screen**: Displays curated movie lists of **Now Playing**, **Popular**, and **Top Rated** movies to help users discover trending titles.  
- **Movie Search**: Allows users to search for any movie by title.  
- **Detailed Movie Information**: Tapping on a movie card opens a details screen showing its poster, title, overview, release date, rating, and genres.  
- **Pagination (See More)**: Each movie section has a **"See More"** button that opens a paginated screen with infinite scroll.  
- **Smooth User Experience**: Implements shimmer loading effects while data is being fetched from the API.  
- **Error Handling**: Gracefully handles API errors and connectivity issues.  
- **Image Caching**: Uses `cached_network_image` for efficient and smooth image loading.  

---

## 🎞️ ScreenShots

<div align="center">

### 🏠 Home & splash
<img src="https://github.com/AyaNasserEzat/movie_app/blob/2c732b8a44c5e4df0724b4292c34109b90867e61/app_screenshots/homeAndSplash.jpeg" width="250"/>

### 🔥 Popular Movies & top rated novies
<img src="https://github.com/AyaNasserEzat/movie_app/blob/2c732b8a44c5e4df0724b4292c34109b90867e61/app_screenshots/top_ratedAndPopular.jpeg" width="250"/>

### ⭐ Movie Details
<img src="https://github.com/AyaNasserEzat/movie_app/blob/2c732b8a44c5e4df0724b4292c34109b90867e61/app_screenshots/details_feature.jpeg" width="250"/>

### 🔍 Search Screen
<img src="https://github.com/AyaNasserEzat/movie_app/blob/2c732b8a44c5e4df0724b4292c34109b90867e61/app_screenshots/search_feature.jpeg" width="250"/>

</div>

---

## 🧱 Architecture & Technical Stack

The application is built following the principles of **Clean Architecture**, ensuring a scalable, maintainable, and testable codebase.

- **Framework**: Flutter  
- **Architecture**: Clean Architecture (Data ➜ Domain ➜ Presentation)  
- **State Management**: Flutter Bloc (Cubit)  
- **Networking**: Dio for HTTP requests  
- **Dependency Injection**: GetIt for dependency management  
- **Error Handling**: Dartz using the `Either` type for functional error handling  
- **Image Caching**: cached_network_image  
- **Loading Animations**: shimmer  
- **API Source**: The Movie Database (TMDB) API  

---

## 📁 Project Structure

The project is organized into feature-centric modules under the `lib/` directory, following the **Clean Architecture** pattern.


├── core/ # Shared code used across multiple features
│ ├── error/ # App-wide error handling classes
│ ├── services/ # API service (Dio client, endpoints)
│ ├── use_cases/ # Base use case classes and definitions
│ ├── utils/ # Helpers, constants, and pagination logic
│ └── widgets/ # Shared custom widgets
│
├── feature/ # Main features of the application
│ ├── home/ # Home screen feature
│ │ ├── data/ # Models, repositories, remote sources
│ │ ├── domain/ # Entities and use cases
│ │ └── presentation/ # UI + Cubits (NowPlaying, Popular, TopRated)
│ │
│ ├── search/ # Search feature
│ │ ├── data/
│ │ ├── domain/
│ │ └── presentation/
└── main.dart # App entry point


- **`core`**: Contains global utilities, API services, error handling, and reusable widgets.  
- **`feature`**: Each directory represents a separate feature (Home, Search, Splash).  
- **`data` layer**: Responsible for fetching and caching data.  
- **`domain` layer**: Defines entities and use cases (business logic).  
- **`presentation` layer**: Contains Cubits and UI widgets/screens.  

---

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### ✅ Prerequisites
- Flutter SDK installed — [Installation Guide](https://docs.flutter.dev/get-started/install)  
- TMDB API key — get it from [The Movie Database](https://www.themoviedb.org)

---

### Installation

1.  Clone the repository:
    ```sh
    git clone https://github.com/AyaNasserEzat/movies_app.git
    ```
2.  Navigate to the project directory:
    ```sh
    cd movies_app
    ```
3.  Install the required dependencies:
    ```sh
    flutter pub get
    ```
4.  Run the application:
    ```sh
    flutter run
