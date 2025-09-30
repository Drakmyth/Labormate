# Labormate
[![License](https://img.shields.io/github/license/Drakmyth/Labormate)](https://github.com/Drakmyth/Labormate/blob/master/LICENSE.md)

Trying to grind profession levels but you have to keep stopping to check your progress because the profession window is too big and the skill up notices in chat are too small?

Labormate is a simple, small window that shows progress bars for each of your professions. Now you can keep fishing, gathering, or crafting and know exactly how much progress you've made.

## Installation

1. Download the latest release from the [Releases page](https://github.com/Drakmyth/Labormate/releases)
1. Navigate to your World of Warcraft installation directory
1. Extract the release archive into the `_retail_\Interface\AddOns` directory
1. Start World of Warcraft and make sure `Labormate` is checked in the AddOns menu

## Usage

Open the tracking window by left-clicking on the minimap button or by using the `/labormate` chat command.

If the progress bars are empty or not displaying your current progress, try hitting the refresh button in the upper-right corner. Profession data is not immediately available, and Blizzard does not provide a way to know when it has been loaded. Refreshing will try to force-load the data. Usually, you only need to do this once after logging in.

You can move the minimap button by dragging it, or you can disable it entirely in the AddOn settings window.

The entry in the AddOn Compartment (the little button below the calendar) functions the same way as the minimap button - Left-click to toggle the tracking window, Right-click to toggle the settings window.

You can quickly access any profession-related abilities by left or right clicking on the badge below each progress bar.

## Issues
If you come across something that seems like a bug, please report it here. Make sure to follow these guidelines to ensure your report isn't closed as "Invalid":

* Make sure you are using the latest Release version of the addon. Old versions of addons are unsupported. Features and fixes will not be backported to old versions.
* Currently this addon is only supported on the retail version of World of Warcraft. It has not been tested and is unsupported on World of Warcraft Classic or any other variation of the game.
* Search to see if someone else has already reported the bug. Duplicate reports just slow down getting things fixed.
* Include steps to reproduce the issue in your report. Screenshots or videos may also prove helpful.

## Feature Requests
Have an idea for other features that would fit well in Labormate? Awesome! File an issue and detail your idea. Keep it succinct and on-point, and only one feature per request, or it will be closed as "Invalid". Then we'll discuss your idea some and decide whether to implement it or not.

## Contributions
Labormate is open source! That means if you'd like to try your hand at fixing a bug or implementing a feature, please do so! Head over to the Issues page and look for any open issues tagged with the "Accepted" label. Create a branch, work on it, then submit a pull request. We'll work together to iron out any concerns with your code, and then we'll merge it in and your code will become a part of Labormate's legacy!

## License
Labormate is licensed under the MIT License (MIT). See [LICENSE](./LICENSE.md) for details.