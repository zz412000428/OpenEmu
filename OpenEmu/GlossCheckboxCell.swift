// Copyright (c) 2020, OpenEmu Team
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the OpenEmu Team nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY OpenEmu Team ''AS IS'' AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL OpenEmu Team BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import Cocoa

@objc(OEGlossCheckboxCell)
final class GlossCheckboxCell: NSButtonCell {
    
    private func subImageRect() -> NSRect {
        
        if state == .on {
            if isHighlighted == true {
                return NSRect(x: 16, y: 16, width: 16, height: 16)
            }
            else if isEnabled == false {
                return NSRect(x: 16, y: 0, width: 16, height: 16)
            }
            else {
                return NSRect(x: 0, y: 16, width: 16, height: 16)
            }
        }
        else if state == .off {
            if isHighlighted == true {
                return NSRect(x: 16, y: 32, width: 16, height: 16)
            }
            else if isEnabled == false {
                return NSRect(x: 0, y: 0, width: 16, height: 16)
            }
            else {
                return NSRect(x: 0, y: 32, width: 16, height: 16)
            }
        }
        else {
            return .zero
        }
    }
    
    override func drawImage(_ image: NSImage, withFrame frame: NSRect, in controlView: NSView) {
        let image = NSImage(named: "gloss_checkbox")?.subImage(from: subImageRect())
        image?.draw(in: frame)
    }
}
