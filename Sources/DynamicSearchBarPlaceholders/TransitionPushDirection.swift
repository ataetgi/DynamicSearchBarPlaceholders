//
//  TransitionPushDirection.swift
//  DynamicSearchBarPlaceholders
//
//  Created by Ata Etgi on 21.08.2023.
//  Copyright © 2023 Ata Etgi. All rights reserved.
//

import UIKit

public enum TransitionPushDirection {
    case fromBottom
    case fromLeft
    case fromRight
    case fromTop

    public var coreAnimationConstant: CATransitionSubtype {
        switch self {
        case .fromBottom:
            return CATransitionSubtype.fromBottom
        case .fromTop:
            return CATransitionSubtype.fromTop
        case .fromLeft:
            return CATransitionSubtype.fromLeft
        case .fromRight:
            return CATransitionSubtype.fromRight
        }
    }
}
