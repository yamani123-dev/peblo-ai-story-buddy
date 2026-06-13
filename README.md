# Peblo AI Story Buddy

## Overview

Peblo AI Story Buddy is a kid-friendly Flutter application that reads a short story aloud using Text-to-Speech (TTS) and then presents an interactive quiz based on the story.

The application is designed to be lightweight, responsive, and suitable for mid-range Android devices with limited memory.

---

## Framework Chosen

### Flutter

I chose Flutter because:

- A single codebase can target multiple platforms.
- Flutter provides smooth performance and fast UI rendering.
- It is lightweight and suitable for mid-range Android devices.
- Flutter offers a rich widget library for creating engaging and colorful interfaces for children.

---

## Audio to Quiz Transition

The story is displayed together with a "Read Aloud" button.

When the user taps the button:

1. Flutter TTS narrates the story.
2. The quiz remains available on the same screen.
3. This avoids unnecessary navigation and reduces memory usage.

In a production version, the quiz can be revealed automatically after narration completion using Flutter TTS completion callbacks.

---

## Data-Driven Quiz Design

The quiz content is stored in a structured data object:

```dart
final Map<String, dynamic> storyData = {
  "story": "Raju found a magic seed in his garden.",
  "question": "What did Raju find?",
  "options": [
    "A Toy",
    "A Magic Seed",
    "A Book",
    "A Ball"
  ],
  "answer": "A Magic Seed"
};
```

### Benefits

- New stories can be added without modifying UI code.
- Different questions can use different option counts.
- The UI dynamically generates quiz options from the data source.

---

## Caching Approach

For this assignment, all story and quiz data is stored locally in memory.

If remote audio files were introduced:

- Audio files would be cached locally after the first download.
- Future playback would use cached content.
- This would reduce network usage and improve performance.

Possible solutions:

- flutter_cache_manager
- local file storage

---

## Audio Loading and Failure States

Current implementation:

- Initializes Flutter TTS before playback.
- Plays narration when the user presses the button.

Production improvements:

- Show loading indicators while preparing audio.
- Display error messages if narration fails.
- Provide retry functionality.
- Gracefully handle unsupported devices.

---

## Performance Profiling

Performance considerations:

- Single-screen architecture.
- Minimal widget hierarchy.
- Local data storage.
- No network requests.
- Lightweight state management using setState().

Testing was performed in Flutter's debug environment to ensure smooth interaction and rendering.

---

## Optimization for Mid-Range Android Devices

The application was optimized by:

- Keeping the UI simple and lightweight.
- Avoiding heavy animations.
- Using local data instead of remote API calls.
- Minimizing memory usage.
- Using efficient widget rebuilding through setState().
- Avoiding unnecessary background processing.

These optimizations help the application run smoothly on Android devices with approximately 3GB RAM.

---

## Features

- Kid-friendly interface
- Story narration using Text-to-Speech
- Interactive quiz
- Data-driven content structure
- Lightweight and responsive design

---

## Tech Stack

- Flutter
- Dart
- flutter_tts package

---

## Author

Bankapalli Sankarao