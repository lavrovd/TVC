//
//  FTAnimation.swift
//  TVC
//
//  Created by Dmitry Lavrov on 21/06/2016.
//  Copyright © 2016 Formal Technology Ltd. All rights reserved.
//

import Foundation
import CoreMedia

enum FTChannelExtrapolation {
    case freeze, constant, cycle, bounce, extrapolate
}

enum FTKeyframeInterpolation {
    case easeIn, easeOut, step, linear
}

// https://habrahabr.ru/post/173897/ for CMTime
class FTKeyframe {
    var time : CMTime
    var value : Double
    var inInterpolation : FTKeyframeInterpolation
    var outInterpolatio : FTKeyframeInterpolation
    
    init( time: CMTime, value: Double ) {
        self.time = time
        self.value = value
        self.inInterpolation = FTKeyframeInterpolation.step
        self.outInterpolatio = FTKeyframeInterpolation.step
    }
}

class FTAnimatedChannel {
    
    var startTime : CMTime
    var duration : Double
    var minValue : Double
    var maxValue : Double
    var defValue : Double
    var extrapolation = FTChannelExtrapolation.freeze
    var keyframes: [FTKeyframe]
    var exression : String?
    var modulator : FTAnimatedChannel?
    
    init(start: CMTime, duration: Double) {
        self.keyframes = [FTKeyframe.init(time: CMTimeMake(0, 600), value: 1.0)]
        self.minValue  = -1.0
        self.maxValue  =  1.0
        self.defValue  =  0.0
        self.startTime = start
        self.duration  = duration
    }
    
    func valueAtTime(_:CMTime) -> Double {
        return 0.0
    }
    
    func addKeyframe(_:FTKeyframe) { }
    func moveKeyframe(_:FTKeyframe, newTime:CMTime) { }
    func keyframe(at time:CMTime) -> FTKeyframe? { return nil}
    func deleteKeyframe(at time:CMTime) -> Bool { return true}

}


struct FTAnimation {
    var channels: [FTAnimatedChannel] = []
}
