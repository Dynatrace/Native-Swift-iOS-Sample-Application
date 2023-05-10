//
//  Utitlities.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 12.01.23.
//

import Foundation

struct Utitlities{
    
    //  not a recomended code to use.
    //  Just for demo.
    let isDebuggerAttached: Bool = {
        var debuggerIsAttached = false

        var name: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        var info: kinfo_proc = kinfo_proc()
        var info_size = MemoryLayout<kinfo_proc>.size

        let success = name.withUnsafeMutableBytes { (nameBytePtr: UnsafeMutableRawBufferPointer) -> Bool in
            guard let nameBytesBlindMemory = nameBytePtr.bindMemory(to: Int32.self).baseAddress else { return false }
            return -1 != sysctl(nameBytesBlindMemory, 4, &info/*UnsafeMutableRawPointer!*/, &info_size/*UnsafeMutablePointer<Int>!*/, nil, 0)
        }

        
        if !success {
            debuggerIsAttached = false
        }

        if !debuggerIsAttached && (info.kp_proc.p_flag & P_TRACED) != 0 {
            debuggerIsAttached = true
        }

        return debuggerIsAttached
    }()
    
}
    
