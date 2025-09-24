# Project Changelog

All notable changes to this project will be documented in this file.  
The format is based on [Keep a Changelog](https://keepachangelog.com/), and this project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added
- Implemented `freezed` models to improve the quality and type safety of data models.
- New drag-and-drop feature, including a special variant for draggable components.
- Completed the initial phase of the drag-and-drop feature.
- Full implementation of the drag-and-drop gameplay feature.

### Changed
- Updated `README.md` with the latest information.
- Completely overhauled the project structure to implement a feature-first architecture.
- Refactored models and fixed a bug in the drag-and-drop dropzone.
- Adjusted the answer pop-up in challenge mode; it now shows the correct answer if the user is wrong.
- Refined the logic for the drag-and-drop feature.
- Refactored the story and challenge modules to improve code quality.

### Fixed
- Fixed a bug in the drag-and-drop feature's dropzone.
- Resolved merge conflicts from the `develop` branch.
- Fixed a minor patch that caused `validateanswer` to never be true.

## [1.0.0] - 2025-05-05

### Added
- Initialized the project with its entire base structure and dependencies.
- Settings page and audio functionality (BGM and SFX).
- New UI components such as `Button`, `Card`, `GameStats`, `Pop-up`, `SettingItem`, and `MenuButton`.
- Backend system for story and challenge modes.
- Image assets for characters, illustrations, and backgrounds.
- Modern navigation system using `go_router`.
- Drag-and-drop feature added as a new gameplay mechanic.
- Keystore for Android application release.

### Changed
- The project structure was changed several times to improve modularity and code readability.
- Optimized the size of image and audio assets to reduce application size.
- The JSON file structure for stories and challenges was periodically updated to support new features.
- The UI in various parts of the application was adjusted to be more responsive and consistent.
- Game logic, including story flow, dialogue, and state management, was refined using Riverpod.
- The audio system was updated to support per-level BGM and various sound effects (SFX).
- Cleaned up and fixed various UI elements, including level cards, character layout, and pop-ups.

### Fixed
- Various game logic bugs, such as level resets, dialogue bugs, and memory leaks, have been fixed.
- Display issues across different screen resolutions (responsiveness) have been addressed.
- Fixed a bug in the navigation system that caused sound to be lost or unsynchronized.
- Merge conflicts from various feature branches were successfully resolved.
- Fixed a bug in the level progress saving logic.
- Fixed a bug that caused the skip button and dialogue to not respond correctly.
- Fixed the character layout and the skip button.

### Removed
- Some SFX assets were temporarily removed.
- Unused pages and code were removed after a major refactoring.
- Removed the "correct answer" message when an answer is wrong in quiz mode.
