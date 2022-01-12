//
//  Screen.swift
//  Marvel
//
//  Created by Alexander Kraev on 12.01.2022.
//

import Foundation
import MarvelNetwork

enum Screen {
    case root
    case character(ModelCharacter?)
    case comic(URL)
}
