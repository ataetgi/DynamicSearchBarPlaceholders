# DynamicSearchBarPlaceholders

A custom searchbar that helps you easily create animated dynamic placeholders.

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fataetgi%2FDynamicSearchBarPlaceholders%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/ataetgi/DynamicSearchBarPlaceholders) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fataetgi%2FDynamicSearchBarPlaceholders%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/ataetgi/DynamicSearchBarPlaceholders) ![Issues](https://img.shields.io/github/issues/ataetgi/DynamicSearchBarPlaceholders) ![License](https://img.shields.io/github/license/ataetgi/DynamicSearchBarPlaceholders) 

![Screenshot](https://github.com/ataetgi/DynamicSearchBarPlaceholders/blob/main/example.gif)

## Installation

### Swift Package Manager

```
.package(name: "DynamicSearchBarPlaceholders", url: "https://github.com/ataetgi/DynamicSearchBarPlaceholders", from: "1.0.0")
```

### Manual

```
1. Download .zip file
2. Just drag and drop DynamicSearchBarPlaceholders folder to your project
```

## Usage
### Quick Usage
```swift
    let searchBar = DynamicSearchBar(placeholders: ["Swift", "Dynamic", "SearchBar", "Placeholders"])
        searchBar.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(searchBar)
    NSLayoutConstraint.activate([
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        searchBar.heightAnchor.constraint(equalToConstant: 60)
    ])
```

### Custom Usage
```swift
    let searchBar = DynamicSearchBar(placeholders: ["Swift", "Dynamic", "SearchBar", "Placeholders"],
                                     timeInterval: 2,
                                     direction: .fromTop,
                                     placeholdersOptions: [.infinite, .shuffle])
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(searchBar)
    NSLayoutConstraint.activate([
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        searchBar.heightAnchor.constraint(equalToConstant: 60)
    ])
```

### Stop animation
```swift
    searchBar.stopPlaceholders()
```

### Resume animation
```swift
    searchBar.resumePlaceholders()
```

## Init Properties
```
placeholders -> Array of placeholder strings
timeInterval -> Placeholder animation interval time 
direction -> Animation direction(it can be .fromTop, .fromBottom, .fromLeft, .fromRight)
placeholdersOptions -> Placeholder options array, it can include .infinite and .shuffle
```

## License

MIT License, Copyright (c) 2023 Ata Etgi, [@ataetgi](https://twitter.com/ataetgi)
