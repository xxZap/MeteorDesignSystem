//
//  MAnimationDuration.swift
//  
//
//  Created by Alessio Boerio on 28/04/24.
//

import Foundation

/// An enum to coordinate animation durations all around the application.
///  
/// Each case has a specific **TimeInterval**
public enum MAnimationDuration: TimeInterval {
    /// 100ms
    case veryFast   = 0.100
    /// 200ms
    case fast       = 0.200
    /// 300ms
    case normal     = 0.300
    /// 400ms
    case slow       = 0.400
    /// 500ms
    case verySlow   = 0.500
}
