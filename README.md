# DynamicSearchBarPlaceholders

A custom searchbar that helps you easily create animated dynamic placeholders.

[![Twitter: @ataetgi](https://img.shields.io/badge/contact-%40ataetgi-blue.svg)](https://twitter.com/ataetgi)
![Issues](https://img.shields.io/github/issues/ataetgi/DynamicSearchBarPlaceholders) ![Forks](https://img.shields.io/github/forks/ataetgi/DynamicSearchBarPlaceholders) ![Stars](https://img.shields.io/github/stars/ataetgi/DynamicSearchBarPlaceholders) ![License](https://img.shields.io/github/license/ataetgi/DynamicSearchBarPlaceholders) 

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

## Example Usage

```swift
    let searchBar = DynamicSearchBar(placeholders: ["Swift", "Dynamic", "SearchBar", "Placeholders"])
```

#### or

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

## Init Properties
```
placeholders -> Array of placeholder strings
timeInterval -> Placeholder animation interval time 
direction -> Animation direction(it can be .fromTop, .fromBottom, .fromLeft, .fromRight)
placeholdersOptions -> Placeholder options array, it can include .infinite and .shuffle
```

## License

MIT License, Copyright (c) 2023 Ata Etgi, [@ataetgi](https://twitter.com/ataetgi)
