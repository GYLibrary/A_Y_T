//
//  AVPlayerItem+EZPlayer.swift
//  EZPlayer
//
//  Created by yangjun zhu on 2016/12/28.
//  Copyright © 2016年 yangjun zhu. All rights reserved.
//

import AVFoundation
public extension AVPlayerItem {

    public var bufferDuration: TimeInterval? {
        if  let first = self.loadedTimeRanges.first {
            let timeRange = first.timeRangeValue
            let startSeconds = CMTimeGetSeconds(timeRange.start)
            let durationSecound = CMTimeGetSeconds(timeRange.duration)
            let result = startSeconds + durationSecound
            return result
        }
        return nil
    }

    public var selectedMediaCharacteristicLegibleOption:AVMediaSelectionOption?{
        get{
            if let legibleGroup = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristicLegible){
                return self.selectedMediaOption(in: legibleGroup)
            }
            return nil
        }
        set{
            if let legibleGroup = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristicLegible){
                self.select(newValue, in: legibleGroup)
            }
        }
    }

    public var selectedClosedCaptionOption:AVMediaSelectionOption?{
        get{
            if let option = self.selectedMediaCharacteristicLegibleOption{
                if option.mediaType == "clcp" {
                    return option
                }
            }
            return nil
        }
        set{
            if let legibleGroup = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristicLegible){
                if newValue == nil{
                    self.select(newValue, in: legibleGroup)
                }else if newValue!.mediaType == "clcp"{
                    self.select(newValue, in: legibleGroup)
                }
            }
        }
    }

    public var selectedSubtitleOption:AVMediaSelectionOption?{
        get{
            if let option = self.selectedMediaCharacteristicLegibleOption{
                if !option.hasMediaCharacteristic(AVMediaCharacteristicContainsOnlyForcedSubtitles) {
                    return option
                }
            }
            return nil
        }
        set{
            if let legibleGroup = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristicLegible){
                if newValue == nil{
                    self.select(newValue, in: legibleGroup)
                }else if !newValue!.hasMediaCharacteristic(AVMediaCharacteristicContainsOnlyForcedSubtitles) {
                    self.select(newValue, in: legibleGroup)
                }
            }
        }
    }

    public var selectedMediaCharacteristicAudibleOption:AVMediaSelectionOption?{
        get{
            if let group = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristicAudible){
                return self.selectedMediaOption(in: group)
            }
            return nil
        }
        set{
            if let group = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristicAudible){
                self.select(newValue, in: group)
            }
        }
    }

}
